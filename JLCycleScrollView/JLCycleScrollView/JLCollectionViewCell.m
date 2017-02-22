//
//  JLCollectionViewCell.m
//  JLCycleScrollView
//
//  Created by lei on 2017/1/26.
//  Copyright © 2017年 lei. All rights reserved.
//

#import "JLCollectionViewCell.h"

@implementation JLCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self != nil) {
        _imageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        [self.contentView addSubview:_imageView];
    }
    return self;
}
@end
