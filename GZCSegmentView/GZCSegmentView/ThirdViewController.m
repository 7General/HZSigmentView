//
//  ThirdViewController.m
//  GZCSegmentView
//
//  Created by zzg on 2019/5/28.
//  Copyright © 2019 zzg. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
}
int counter = 0;
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (0 == counter) {
//        NSMutableArray* arr = [NSMutableArray arrayWithArray:self.navigationController.viewControllers];
//        NSLog(@"TLOG:%@", [arr lastObject]);
//        [arr removeLastObject];
//        [self.navigationController setViewControllers:arr animated:NO];
        counter++;
    }
    else if(1 == counter)
    {
         [self dismissViewControllerAnimated:YES completion:nil];
        counter = 0;
    }
//    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
