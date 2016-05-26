//
//  MainViewController.m
//  HZSigmentView
//
//  Created by 王会洲 on 16/5/26.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "MainViewController.h"
#import "HZSigmentView.h"

@interface MainViewController ()<HZSigmentViewDelegate>
@property (nonatomic, strong) HZSigmentView * sigment;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"HZSigmentView";
    
//    NSLog(@"------%ld",self.navigationController.navigationBar.translucent);
    
    self.navigationController.navigationBar.translucent = NO;
    
    self.sigment = [[HZSigmentView alloc] initWithOrgin:CGPointMake(0, 0) andHeight:44];
    self.sigment.delegate = self;
    self.sigment.titleArry = @[@"核桃",@"苹果",@"橘子",@"橙子",@"人民",@"打印机",@"电脑"];
    
    // 设置标题选中时的颜色
    //self.sigment.titleSelectColor = DDMColor(155, 0, 10);
    // 设置标题未选中的颜色
//    self.sigment.titleNomalColor = [UIColor redColor];
    // 默认选中第几项
    //self.sigment.defaultIndex = 2;
    // 设置标题字体大小
//    self.sigment.titleFont = [UIFont systemFontOfSize:9];

    
    [self.view addSubview:self.sigment];
    
}


@end
