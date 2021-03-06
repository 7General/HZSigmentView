//
//  MainViewController.m
//  HZSigmentView
//
//  Created by 王会洲 on 16/5/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#define SCRWIDTH [UIScreen mainScreen].bounds.size.width
#define SCRHEIGHT [UIScreen mainScreen].bounds.size.height

#import "MainViewController.h"
#import "HZSigmentView.h"

@interface MainViewController ()<HZSigmentViewDelegate>
@property (nonatomic, strong) HZSigmentView * sigment;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HZSigmentView";
    
////    NSLog(@"------%ld",self.navigationController.navigationBar.translucent);
//    // 原点从（0，64）开始
////    self.navigationController.navigationBar.translucent = NO;
//    // 原点从（0，0）开始
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    
//    // ###########################################
//    // 原点从（0，64）开始
    self.automaticallyAdjustsScrollViewInsets = NO;
//    //self.edgesForExtendedLayout = UIRectEdgeNone;
//
//    
    self.sigment = [[HZSigmentView alloc] initWithOrgin:CGPointMake(0, 64) andHeight:44];
    self.sigment.delegate = self;
    self.sigment.titleArry = @[@"核桃",@"苹果",@"西游记",@"麦城"];
    
    // 设置标题选中时的颜色
//    self.sigment.titleColorSelect = DDMColor(155, 0, 10);
    // 设置标题未选中的颜色
//    self.sigment.titleColorNormal = [UIColor redColor];
    // 默认选中第几项
    //self.sigment.defaultIndex = 2;
    // 设置标题字体大小
//    self.sigment.titleFont = [UIFont systemFontOfSize:9];
    
//    self.sigment.bottomLineColor = [UIColor yellowColor];
    self.sigment.titleLineColor = [UIColor grayColor];
    self.sigment.defaultIndex = 3;
    [self.view addSubview:self.sigment];

    
    
    
    
    
    
    
}
-(void)segment:(HZSigmentView *)sengment didSelectColumnIndex:(NSInteger)index {
    NSLog(@"-----%ld",index);
}



@end
