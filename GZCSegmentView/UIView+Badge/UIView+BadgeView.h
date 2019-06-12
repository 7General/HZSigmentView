//
//  UIView+Badge.h
//  GZCSegmentView
//
//  Created by zzg on 2019/5/27.
//  Copyright © 2019 zzg. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


typedef NS_ENUM(NSUInteger, BadgePosition) {
    BadgePositionTopLeft,
    BadgePositionTopRight,
    BadgePositionBottomLeft,
    BadgePositionBottomRight,
};


@interface UIView (BadgeView)

@property (strong, nonatomic) UILabel *badge;

/* 常规Badge 显示 */
@property (nonatomic) NSString *badgeValue;

/* 警告信息 */
@property (nonatomic) NSString *waringBadge;

/* Badge的背景色 */
@property (nonatomic) UIColor *badgeBGColor;

/* Badge的字体颜色 */
@property (nonatomic) UIColor *badgeTextColor;

/* Badge的字体 */
@property (nonatomic) UIFont *badgeFont;

/* 内边距 */
@property (nonatomic) CGFloat badgePadding;

/* Badge最小size */
@property (nonatomic) CGFloat badgeMinSize;

/* 设置offset */
@property (nonatomic) CGFloat horizontalOffset;
@property (nonatomic) CGFloat verticalOffset;

@property (nonatomic) BadgePosition position;

/* 删除badge 可设置zero */
@property BOOL shouldHideBadgeAtZero;
/* 弹簧动画有数据变化 */
@property BOOL shouldAnimateBadge;


@end

NS_ASSUME_NONNULL_END
