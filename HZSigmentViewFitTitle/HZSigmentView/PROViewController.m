
//
//  PROViewController.m
//  HZSigmentView
//
//  Created by ZZG on 17/6/14.
//  Copyright © 2017年 王会洲. All rights reserved.
//

#import "PROViewController.h"
#import "HZSigmentView.h"

@interface PROViewController ()<HZSigmentViewDelegate>
@property (nonatomic, strong) HZSigmentView * sigment;
@end

@implementation PROViewController

-(void)setChangeBlock:(changeChan)changeBlock {
    _changeBlock = [changeBlock copy];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    self.sigment = [[HZSigmentView alloc] initWithOrgin:CGPointMake(0, 64) andHeight:44];
    self.sigment.delegate = self;
    self.sigment.defaultIndex = self.defSelect;
    self.sigment.titleArry = @[@"核桃1",@"苹果2",@"西游记3",@"麦城4",@"核桃5",@"苹果6",@"西游记7",@"麦城西游记7西游记7"];
    
    // 设置标题选中时的颜色
    //    self.sigment.titleColorSelect = DDMColor(155, 0, 10);
    // 设置标题未选中的颜色
    //    self.sigment.titleColorNormal = [UIColor redColor];
    // 默认选中第几项
    //    self.sigment.defaultIndex = 2;
    // 设置标题字体大小
    //    self.sigment.titleFont = [UIFont systemFontOfSize:9];
    
    //    self.sigment.bottomLineColor = [UIColor yellowColor];
    self.sigment.titleLineColor = [UIColor grayColor];
    [self.view addSubview:self.sigment];
}
-(void)segment:(HZSigmentView *)sengment didSelectColumnIndex:(NSInteger)index {
    if (self.changeBlock) {
        self.changeBlock(index);
    }
  
}


@end
