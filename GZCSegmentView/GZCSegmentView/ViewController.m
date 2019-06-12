//
//  ViewController.m
//  GZCSegmentView
//
//  Created by zzg on 2019/5/27.
//  Copyright © 2019 zzg. All rights reserved.
//

#import "ViewController.h"
#import "GZCCommonSegmentView.h"
#import "UIView+BadgeView.h"


@interface ViewController ()<GZCCommonSegmentViewDelegate>



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    GZCCommonSegmentView * segment = [[GZCCommonSegmentView alloc] initWithOrgin:CGPointMake(0, 64) andHeight:45];
    GZCCommonSegmentView * segment = [[GZCCommonSegmentView alloc] initWithFrame:CGRectMake(10, 64, CMWIDTH - 20, 45)];
    segment.dataSource = @[@"1瑕疵",@"2瑕疵",@"3瑕疵",@"4瑕疵",@"5瑕疵",@"6瑕疵",@"7瑕疵"].mutableCopy;
//    segment.dataSource = @[@"1瑕疵",@"2瑕疵"].mutableCopy;

    
    
    
    
    segment.delegate = self;
    segment.titleColorSelected = [UIColor redColor];
    segment.titleFontSelected = [UIFont systemFontOfSize:20];
    segment.titleFontNormal = [UIFont systemFontOfSize:10];

    segment.bottomViewColor = [UIColor blueColor];
    segment.bottomViewHeight = 2;
    segment.floatViewColor = [UIColor greenColor];
    segment.floatViewSize = CGSizeMake(30, 20);
    segment.floatCornerRadius = 5;
    segment.selectIndex = 3;
    
    [self.view addSubview:segment];
    
    
    
//
//    UIView * badgeView = [[UIView alloc] initWithFrame:CGRectMake(50, 200, 50, 50)];
//    badgeView.backgroundColor = [UIColor greenColor];
//    badgeView.layer.cornerRadius = 25;
////    badgeView.layer.masksToBounds = YES;
//    [self.view addSubview:badgeView];
//
//    badgeView.badgeValue = @"2";
////    badgeView.waringBadge = @"123";
////    badgeView.horizontalOffset = -20;
////    badgeView.verticalOffset = -20;
////    badgeView.badgeBGColor = [UIColor redColor];
////    badgeView.badgeTextColor = [UIColor redColor];
////    badgeView.badgeFont = [UIFont systemFontOfSize:20];
////    badgeView.badgePadding = 2;
////    badgeView.position =  BadgePositionBottomLeft;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////        badgeView.waringBadge = @"66666";
//        badgeView.badgeValue = @"999";
//
//    });
//
//
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 350, 100, 50);
//    [btn setBackgroundColor:[UIColor blueColor]];
//    btn.layer.cornerRadius = 5;
//    [self.view addSubview:btn];
//    [btn setTitle:@"buttonbuttonbutton" forState:UIControlStateNormal];
//    btn.badgeValue = @"123";
//
//
//    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(100, 440, 100, 50)];
//    label.text = @"ceshi";
//    label.textAlignment = NSTextAlignmentCenter;
//    label.backgroundColor = [UIColor grayColor];
//
//    [self.view addSubview:label];
//    label.badgeValue = @"5";
//
//
//    UIButton * btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn1.frame = CGRectMake(100, 550, 100, 50);
//    [btn1 setBackgroundColor:[UIColor blueColor]];
//    btn1.layer.cornerRadius = 5;
//    [btn1 setTitle:@"buttonbuttonbutton" forState:UIControlStateNormal];
//    [self.view addSubview:btn1];
//    btn1.badgeValue = @"123";
    
}

- (void)commonSegment:(GZCCommonSegmentView *)segmentView didSelectIndex:(NSInteger)index {
    NSLog(@"-----:%ld",index);
}


@end
