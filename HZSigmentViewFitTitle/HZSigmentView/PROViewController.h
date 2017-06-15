//
//  PROViewController.h
//  HZSigmentView
//
//  Created by ZZG on 17/6/14.
//  Copyright © 2017年 王会洲. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^changeChan)(NSInteger defaultIndex);
@interface PROViewController : UIViewController
@property (nonatomic, copy) changeChan changeBlock;
-(void)setChangeBlock:(changeChan)changeBlock;

@property (nonatomic, assign) NSInteger defSelect;

@end
