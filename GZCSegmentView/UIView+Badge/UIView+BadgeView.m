//
//  UIView+Badge.m
//  GZCSegmentView
//
//  Created by zzg on 2019/5/27.
//  Copyright © 2019 zzg. All rights reserved.
//

#import "UIView+BadgeView.h"
#import <objc/runtime.h>


NSString const *badgeKey = @"badgeKey";

NSString const *badgeBGColorKey = @"badgeBGColorKey";
NSString const *badgeTextColorKey = @"badgeTextColorKey";
NSString const *badgeFontKey = @"badgeFontKey";
NSString const *badgePaddingKey = @"badgePaddingKey";
NSString const *badgeMinSizeKey = @"badgeMinSizeKey";
NSString const *horizontalOffsetKey = @"horizontalOffsetKey";
NSString const *verticalOffsetKey = @"verticalOffsetKey";
NSString const *postionKey = @"positionValueKey";
NSString const *shouldHideBadgeAtZeroKey = @"shouldHideBadgeAtZeroKey";
NSString const *shouldAnimateBadgeKey = @"shouldAnimateBadgeKey";
NSString const *badgeValueKey = @"badgeValueKey";
NSString const *WarinbadgeValueKey = @"WarnbadgeValueKey";

@implementation UIView (BadgeView)

@dynamic badgeValue,waringBadge, badgeBGColor, badgeTextColor, badgeFont;
@dynamic badgePadding, badgeMinSize, horizontalOffset, verticalOffset, position;
@dynamic shouldHideBadgeAtZero, shouldAnimateBadge;

- (void)badgeInit {
    self.badgeBGColor   = [UIColor redColor];
    self.badgeTextColor = [UIColor whiteColor];
    self.badgeFont      = [UIFont systemFontOfSize:12.0];
    self.badgePadding   = 5;
    self.badgeMinSize   = 8;
    self.horizontalOffset  = 0.0;
    self.verticalOffset   = 0.0;
    self.position = BadgePositionTopRight;
    self.shouldHideBadgeAtZero = YES;
    self.shouldAnimateBadge = YES;
}

- (void)refreshBadge {
    self.badge.textColor        = self.badgeTextColor;
    self.badge.backgroundColor  = self.badgeBGColor;
    self.badge.font             = self.badgeFont;
}

- (CGSize) badgeExpectedSize {
    UILabel *frameLabel = [self duplicateLabel:self.badge];
    [frameLabel sizeToFit];
    
    CGSize expectedLabelSize = frameLabel.frame.size;
    return expectedLabelSize;
}


- (UILabel *)duplicateLabel:(UILabel *)labelToCopy {
    UILabel *duplicateLabel = [[UILabel alloc] initWithFrame:labelToCopy.frame];
    duplicateLabel.text = labelToCopy.text;
    duplicateLabel.font = labelToCopy.font;
    return duplicateLabel;
}


- (void)updateBadgeFrame {
    CGSize expectedLabelSize = [self badgeExpectedSize];
    CGFloat minHeight = expectedLabelSize.height;
    
    minHeight = (minHeight < self.badgeMinSize) ? self.badgeMinSize : expectedLabelSize.height;
    CGFloat minWidth = expectedLabelSize.width;
    CGFloat padding = self.badgePadding;
    
    minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width;
    CGFloat badgeX = self.frame.size.width - minWidth * 0.5 + self.horizontalOffset;
    CGFloat badgeY = - minHeight * 0.5 + self.verticalOffset;
    
    self.badge.frame = CGRectMake(badgeX, badgeY, minWidth + padding, minHeight + padding);
    self.badge.layer.cornerRadius = (minHeight + padding) * 0.5;
    self.badge.layer.masksToBounds = YES;
}

- (void)updateLitterBadgeFrame {
    CGSize expectedLabelSize = [self badgeExpectedSize];
    
    CGFloat minHeight = expectedLabelSize.height;
    
    minHeight = (minHeight < self.badgeMinSize) ? self.badgeMinSize : expectedLabelSize.height;
    CGFloat minWidth = expectedLabelSize.width;
    CGFloat padding = self.badgePadding;
    
    minWidth = (minWidth < minHeight) ? minHeight : expectedLabelSize.width;
    
    CGFloat badgeX = self.frame.size.width - minWidth * 0.5 + self.horizontalOffset;
    CGFloat badgeY = - minHeight * 0.5 + self.verticalOffset;
    self.badge.frame = CGRectMake(badgeX, badgeY, minWidth + padding, minHeight + padding);
    self.badge.layer.cornerRadius = (minHeight + padding) * 0.5;
    self.badge.layer.masksToBounds = YES;
}


- (void)updateBadgeValueAnimated:(BOOL)animated {
    if (animated && self.shouldAnimateBadge && ![self.badge.text isEqualToString:self.badgeValue]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.badge.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    
    self.badge.text = self.badgeValue;
    
    NSTimeInterval duration = animated ? 0.2 : 0;
    [UIView animateWithDuration:duration animations:^{
        [self updateBadgeFrame];
    }];
}


- (void)updateLitterBadgeValueAnimated:(BOOL)animated {
    if (animated && self.shouldAnimateBadge && ![self.badge.text isEqualToString:self.badgeValue]) {
        CABasicAnimation * animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
        [animation setFromValue:[NSNumber numberWithFloat:1.5]];
        [animation setToValue:[NSNumber numberWithFloat:1]];
        [animation setDuration:0.2];
        [animation setTimingFunction:[CAMediaTimingFunction functionWithControlPoints:.4f :1.3f :1.f :1.f]];
        [self.badge.layer addAnimation:animation forKey:@"bounceAnimation"];
    }
    
    self.badge.text = self.badgeValue;
    
    NSTimeInterval duration = animated ? 0.2 : 0;
    [UIView animateWithDuration:duration animations:^{
        [self updateLitterBadgeFrame];
    }];
}



- (void)removeBadge {
    [UIView animateWithDuration:0.2 animations:^{
        self.badge.transform = CGAffineTransformMakeScale(0, 0);
    } completion:^(BOOL finished) {
        [self.badge removeFromSuperview];
        self.badge = nil;
    }];
}

#pragma mark - getters/setters
- (UILabel*) badge {
    return objc_getAssociatedObject(self, &badgeKey);
}

- (void)setBadge:(UILabel *)badgeLabel {
    objc_setAssociatedObject(self, &badgeKey, badgeLabel, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSString *)badgeValue {
    return objc_getAssociatedObject(self, &badgeValueKey);
}

- (void)setBadgeValue:(NSString *)badgeValue {
    objc_setAssociatedObject(self, &badgeValueKey, badgeValue, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if (!badgeValue ||
        [badgeValue isEqualToString:@""] ||
        ([badgeValue isEqualToString:@"0"] && self.shouldHideBadgeAtZero)) {
        
        [self removeBadge];
        
    } else if (!self.badge) {
        self.badge                      = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
        self.badge.textColor            = self.badgeTextColor;
        self.badge.backgroundColor      = self.badgeBGColor;
        self.badge.font                 = self.badgeFont;
        self.badge.textAlignment        = NSTextAlignmentCenter;
        [self badgeInit];
        [self addSubview:self.badge];
        [self updateBadgeValueAnimated:NO];
    } else {
        [self updateBadgeValueAnimated:YES];
    }
}

- (NSString *)waringBadge {
    return objc_getAssociatedObject(self, &WarinbadgeValueKey);
}

- (void)setWaringBadge:(NSString *)waringBadge {
    objc_setAssociatedObject(self, &WarinbadgeValueKey, waringBadge, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

    if (!waringBadge ||
        [waringBadge isEqualToString:@""] ||
        ([waringBadge isEqualToString:@"0"] && self.shouldHideBadgeAtZero)) {
        
        [self removeBadge];
        
    } else if (!self.badge) {
        self.badge = [[UILabel alloc] initWithFrame:CGRectMake(0,0,10, 10)];
        self.badge.textColor            = self.badgeTextColor;
        self.badge.backgroundColor      = self.badgeBGColor;
        self.badge.font                 = self.badgeFont;
        self.badge.textAlignment        = NSTextAlignmentCenter;
        [self badgeInit];
        [self addSubview:self.badge];
        [self updateLitterBadgeValueAnimated:NO];
    } else {
        [self updateLitterBadgeValueAnimated:YES];
    }
}



- (UIColor *)badgeBGColor {
    return objc_getAssociatedObject(self, &badgeBGColorKey);
}
- (void)setBadgeBGColor:(UIColor *)badgeBGColor {
    objc_setAssociatedObject(self, &badgeBGColorKey, badgeBGColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self refreshBadge];
    }
}

- (UIColor *)badgeTextColor {
    return objc_getAssociatedObject(self, &badgeTextColorKey);
}
- (void)setBadgeTextColor:(UIColor *)badgeTextColor {
    objc_setAssociatedObject(self, &badgeTextColorKey, badgeTextColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self refreshBadge];
    }
}



- (UIFont *)badgeFont {
    return objc_getAssociatedObject(self, &badgeFontKey);
}
- (void)setBadgeFont:(UIFont *)badgeFont {
    objc_setAssociatedObject(self, &badgeFontKey, badgeFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self refreshBadge];
    }
}


- (CGFloat) badgePadding {
    NSNumber *number = objc_getAssociatedObject(self, &badgePaddingKey);
    return number.floatValue;
}
- (void) setBadgePadding:(CGFloat)badgePadding {
    NSNumber *number = [NSNumber numberWithDouble:badgePadding];
    objc_setAssociatedObject(self, &badgePaddingKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self updateBadgeFrame];
    }
}


- (CGFloat) badgeMinSize {
    NSNumber *number = objc_getAssociatedObject(self, &badgeMinSizeKey);
    return number.floatValue;
}
- (void) setBadgeMinSize:(CGFloat)badgeMinSize {
    NSNumber *number = [NSNumber numberWithDouble:badgeMinSize];
    objc_setAssociatedObject(self, &badgeMinSizeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self updateBadgeFrame];
    }
}


- (CGFloat) horizontalOffset {
    NSNumber *number = objc_getAssociatedObject(self, &horizontalOffsetKey);
    return number.floatValue;
}
- (void)setHorizontalOffset:(CGFloat)horizontalOffset {
    NSNumber *number = [NSNumber numberWithDouble:horizontalOffset];
    objc_setAssociatedObject(self, &horizontalOffsetKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self updateBadgeFrame];
    }
}


- (CGFloat) verticalOffset {
    NSNumber *number = objc_getAssociatedObject(self, &verticalOffsetKey);
    return number.floatValue;
}
- (void)setVerticalOffset:(CGFloat)verticalOffset {
    NSNumber *number = [NSNumber numberWithDouble:verticalOffset];
    objc_setAssociatedObject(self, &verticalOffsetKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self updateBadgeFrame];
    }
}


- (BOOL) shouldHideBadgeAtZero {
    NSNumber *number = objc_getAssociatedObject(self, &shouldHideBadgeAtZeroKey);
    return number.boolValue;
}
- (void)setShouldHideBadgeAtZero:(BOOL)shouldHideBadgeAtZero {
    NSNumber *number = [NSNumber numberWithBool:shouldHideBadgeAtZero];
    objc_setAssociatedObject(self, &shouldHideBadgeAtZeroKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (BOOL) shouldAnimateBadge {
    NSNumber *number = objc_getAssociatedObject(self, &shouldAnimateBadgeKey);
    return number.boolValue;
}
- (void)setShouldAnimateBadge:(BOOL)shouldAnimateBadge {
    NSNumber *number = [NSNumber numberWithBool:shouldAnimateBadge];
    objc_setAssociatedObject(self, &shouldAnimateBadgeKey, number, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BadgePosition)position {
    NSNumber *number = objc_getAssociatedObject(self, &postionKey);
    return number.integerValue;
}

- (void)setPosition:(BadgePosition)position {
    NSNumber *positionKey = [NSNumber numberWithDouble:position];
    objc_setAssociatedObject(self, &postionKey, positionKey, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    if (self.badge) {
        [self updateBadgeViewPosition];
    }
}


- (void)updateBadgeViewPosition {
    CGSize badgeSize = self.bounds.size;
    
    BadgePosition position = self.position;
    
    switch (position) {
        case BadgePositionTopRight: {
            self.badge.center = CGPointMake(badgeSize.width + self.horizontalOffset,  self.verticalOffset);
            break;
        }
        case BadgePositionTopLeft: {
            self.badge.center = CGPointMake(self.horizontalOffset,self.verticalOffset);
            break;
        }
        case BadgePositionBottomRight: {
            self.badge.center = CGPointMake(badgeSize.width + self.horizontalOffset, badgeSize.height + self.verticalOffset);
            break;
        }
        case BadgePositionBottomLeft: {
            self.badge.center = CGPointMake(self.horizontalOffset, badgeSize.height + self.verticalOffset);
            break;
        }
        default:
            break;
    }
}



@end
