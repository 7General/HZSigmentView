//
//  GZCCommonSegmentView.h
//  GZCSegmentView
//
//  Created by zzg on 2019/5/27.
//  Copyright © 2019 zzg. All rights reserved.
//


#define CMWIDTH [UIScreen mainScreen].bounds.size.width

#define CMHEIGHT [UIScreen mainScreen].bounds.size.height

#define CColor(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]



#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class GZCCommonSegmentView;

@protocol GZCCommonSegmentViewDelegate <NSObject>

@optional
- (void)commonSegment:(GZCCommonSegmentView *)segmentView didSelectIndex:(NSInteger)index;

@end

@interface GZCCommonSegmentView : UIView

@property (nonatomic,strong) NSArray * dataSource;

/** 未选中时的文字颜色 ,默认颜色CColor(95, 102, 112) */
@property (nonatomic,strong) UIColor * titleColorNormal;
@property (nonatomic,strong) UIFont * titleFontNormal;

/**选中时的文字颜色，默认颜色CColor(34, 172, 56) */
@property (nonatomic,strong) UIColor * titleColorSelected;
@property (nonatomic,strong) UIFont * titleFontSelected;

/**底边线条颜色*/
@property (nonatomic, strong) UIColor * bottomViewColor;
/**底部横线高度*/
@property (nonatomic, assign) CGFloat  bottomViewHeight;

/**浮动游标颜色*/
@property (nonatomic, strong) UIColor * floatViewColor;
/* 浮动游标size */
@property (nonatomic, assign) CGSize  floatViewSize;
/**浮动游标弧度*/
@property (nonatomic, assign) CGFloat  floatCornerRadius;


/* 设置默认选中的索引 */
@property (nonatomic, assign) NSInteger  selectIndex;

- (void)selectIndexAtItem:(NSInteger)index;

+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@property (nonatomic, weak) id<GZCCommonSegmentViewDelegate>  delegate;



@end

NS_ASSUME_NONNULL_END
