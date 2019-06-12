//
//  ReloadView.m
//  GZCSegmentView
//
//  Created by zzg on 2019/5/30.
//  Copyright © 2019 zzg. All rights reserved.
//

#import "ReloadView.h"

@implementation ReloadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}


- (void)reloadCard:(NSString *)cards {
    NSLog(@"-=-=-=-=-:%@",cards);
}

@end
