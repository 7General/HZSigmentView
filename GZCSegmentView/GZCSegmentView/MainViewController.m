//
//  MainViewController.m
//  GZCSegmentView
//
//  Created by zzg on 2019/5/28.
//  Copyright © 2019 zzg. All rights reserved.
//

#import "MainViewController.h"
#import "SECViewController.h"
#import "ReloadView.h"
#import "ViewController.h"

@interface MainViewController ()
@property (nonatomic, strong) ReloadView * re;
@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"main";
    self.re = [[ReloadView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:self.re];
    
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    SECViewController * sec = [[SECViewController alloc] init];
//    [self.navigationController pushViewController:sec animated:YES];
    
//    [self.re reloadCard:@"123123123123123123"];
    ViewController * vc = [[ViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
    
}



@end
