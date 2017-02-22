//
//  JLCycleScrollView.h
//  JLCycleScrollView
//
//  Created by lei on 2017/1/25.
//  Copyright © 2017年 lei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JLCycleScrollView : UIView<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic,strong) NSArray *dataSource;
@property (nonatomic,strong) UIPageControl *pageControl;
@property (nonatomic) double intervalTime;

@property (nonatomic,strong) UIColor *currentPageDotColor;
@property (nonatomic,strong) UIColor *pageDotColor;
-(instancetype)initWithFrame:(CGRect)frame images:(NSArray *)images;
@end
