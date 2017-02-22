//
//  JLCycleScrollView.m
//  JLCycleScrollView
//
//  Created by lei on 2017/1/25.
//  Copyright © 2017年 lei. All rights reserved.
//

#import "JLCycleScrollView.h"
#import "JLCollectionViewCell.h"

@implementation JLCycleScrollView {
    UICollectionView *_collectionView;
    NSTimer *timer;
    double height;
    double width;
    
    int totalCout;
}

-(instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images{
    self = [super initWithFrame:frame];
    if (self != nil) {
        height = frame.size.height;
        width = frame.size.width;
        _dataSource = images;
        totalCout = (int)_dataSource.count * 100;
        _intervalTime = 2;
        [self setUpMainView];
        [self createCollectionView];
        [self createPageControl];
        [self setUpTimer];
    }
    return self;
}

-(void) setUpMainView {
    
}

-(void) createCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(width, height);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.minimumLineSpacing = 0;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, width, height) collectionViewLayout:layout];
    [self addSubview:_collectionView];
    
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.pagingEnabled = YES;
    _collectionView.showsHorizontalScrollIndicator = NO;
    _collectionView.backgroundColor = [UIColor clearColor];
    
    [_collectionView registerClass:[JLCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:totalCout*0.5 inSection:0];
    [_collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
}

-(void)createPageControl {
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, height - 20, width, 20)];
    _pageControl.numberOfPages = _dataSource.count;
    _pageControl.pageIndicatorTintColor = [UIColor orangeColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:_pageControl];
}

-(void) automaticScroll {
    int currenIndex = (int)_collectionView.contentOffset.x/width;
    int nextIndex = currenIndex + 1;
    if (nextIndex == totalCout) {
        nextIndex = totalCout * 0.5;
        [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:NO];
    }
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextIndex inSection:0] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
}

-(void) setUpTimer {
    if (timer != nil) {
        [timer invalidate];
        timer = nil;
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:_intervalTime target:self selector:@selector(automaticScroll) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return totalCout;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    JLCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    int index = (int)(indexPath.item % _dataSource.count);
    cell.imageView.image = _dataSource[index];
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int index = (int)(scrollView.contentOffset.x/width + 0.5);
    int page = index % _dataSource.count;
    _pageControl.currentPage = page;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    [timer invalidate];
    timer = nil;
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
    [self setUpTimer];
}


-(void)setPageDotColor:(UIColor *)pageDotColor {
    _pageControl.pageIndicatorTintColor = pageDotColor;
}
-(void)setCurrentPageDotColor:(UIColor *)currentPageDotColor {
    _pageControl.currentPageIndicatorTintColor = currentPageDotColor;
}

@end












