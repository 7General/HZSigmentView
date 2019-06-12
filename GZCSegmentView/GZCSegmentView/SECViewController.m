//
//  SECViewController.m
//  GZCSegmentView
//
//  Created by zzg on 2019/5/28.
//  Copyright © 2019 zzg. All rights reserved.
//

#import "SECViewController.h"
#import "ThirdViewController.h"

@interface SECViewController ()

@end

@implementation SECViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"sec";
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ThirdViewController * third = [[ThirdViewController alloc] init];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//    });
    NSMutableArray* arr = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
    __weak typeof (self) weakS = self;
    [self presentViewController:third animated:YES completion:^{
        
                [weakS.navigationController popViewControllerAnimated:NO];
    }];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_global_queue(0,0), ^{
//        NSLog(@"TLOG:%@", [arr lastObject]);
//        [arr removeLastObject];
//        [self.navigationController setViewControllers:arr animated:NO];
//    });
    
//    NSMutableArray* arr = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
//    NSLog(@"TLOG:%@", [arr lastObject]);
//    [arr removeLastObject];
//    
//    [self.navigationController setViewControllers:arr animated:NO];
//
//    [self.navigationController popViewControllerAnimated:NO];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"%@", self);
//    });

    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)dealloc {

    NSLog(@"sssssss");
}
@end
