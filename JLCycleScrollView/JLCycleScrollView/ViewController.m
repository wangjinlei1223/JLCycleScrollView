//
//  ViewController.m
//  JLCycleScrollView
//
//  Created by lei on 2017/1/25.
//  Copyright © 2017年 lei. All rights reserved.
//

#import "ViewController.h"
#import "JLCycleScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSArray *array = @[[UIImage imageNamed:@"Login01"],[UIImage imageNamed:@"Login02"],[UIImage imageNamed:@"Login03"],[UIImage imageNamed:@"Login04"]];
    
    CGRect rect = CGRectMake(60, 100, 200, 200);
    JLCycleScrollView *view = [[JLCycleScrollView alloc] initWithFrame:rect images:array];
    view.currentPageDotColor = [UIColor orangeColor];
    view.pageDotColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
