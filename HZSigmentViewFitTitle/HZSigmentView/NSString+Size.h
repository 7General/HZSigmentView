//
//  NSString+Size.h
//  NingboSat
//
//  Created by 王会洲 on 16/9/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface NSString (Size)
- (CGSize)heightWithFont:(UIFont *)Font width:(CGFloat)width;
- (CGSize)widthWithFont:(UIFont *)Font height:(CGFloat)height;

/**
 获取当前时间

 @return <#return value description#>
 */
+ (NSString * )getCurrentTimes;

/**
 获取当前日期

 @return 当前日期08-09
 */
+(NSString *)getCurrentData;

/**
 获取当前时分
 
 @return 当前日期08-09
 */
+ (NSString *)getCurrentTime;

/**
 周几

 @return <#return value description#>
 */
+ (NSString *)getWeek;


+(NSString *)getShortStrByFormat:(NSString *)formate;
/**
 *  设置段落样式
 *
 *  @param lineSpacing 行高
 *  @param textcolor   字体颜色
 *  @param font        字体
 *
 *  @return 富文本
 */
-(NSAttributedString *)stringWithParagraphlineSpeace:(CGFloat)lineSpacing
                                           textColor:(UIColor *)textcolor
                                            textFont:(UIFont *)font;

/**
 *  计算富文本字体高度
 *
 *  @param lineSpeace 行高
 *  @param font       字体
 *  @param width      字体所占宽度
 *
 *  @return 富文本高度
 */
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width;


/**
 判断手机号
 
 手机号
 @return <#return value description#>
 */
- (BOOL)checkTelNumber;

@end
