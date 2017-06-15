//
//  NSString+Size.m
//  NingboSat
//
//  Created by 王会洲 on 16/9/27.
//  Copyright © 2016年 王会洲. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)
- (CGSize)heightWithFont:(UIFont *)Font width:(CGFloat)width {
    return [self heightWithFont:Font width:CGSizeMake(width, MAXFLOAT) linebreak:NSStringDrawingUsesLineFragmentOrigin];
}

- (CGSize)heightWithFont:(UIFont *)withFont width:(CGSize)sizes linebreak:(NSStringDrawingOptions)Options{
    NSDictionary * attrs = @{NSFontAttributeName : withFont};
    CGSize maxSize = sizes;//CGSizeMake(width, MAXFLOAT);
    return [self boundingRectWithSize:maxSize options:Options attributes:attrs context:nil].size;
}


- (CGSize)widthWithFont:(UIFont *)Font height:(CGFloat)height {
     return [self heightWithFont:Font width:CGSizeMake(MAXFLOAT, height) linebreak:NSStringDrawingUsesLineFragmentOrigin];
}

+ (NSString * )getCurrentTimes{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd  HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSLog(@"currentTimeString =  %@",currentTimeString);
    return currentTimeString;
}

/**
 获取当前日期
 
 @return 当前日期08月09日
 */
+ (NSString *)getCurrentData {
    return [NSString getShortStrByFormat:@"MM月dd日"];
}
/**
 获取当前时分
 
 @return 当前日期08-09
 */
+ (NSString *)getCurrentTime {
    return [NSString getShortStrByFormat:@"HH:mm"];
}

+(NSString *)getShortStrByFormat:(NSString *)formate {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:formate];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    NSLog(@"currentTimeString =  %@",currentTimeString);
    return currentTimeString;
}

+ (NSString *)currentDate {
    NSDate *date = [NSDate date];
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSString *weekString = [dateformatter stringFromDate:date];
    return weekString;
}

+ (NSString *)getWeek {
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDate *now;
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit |
    NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    
    now=[NSDate date];
    comps = [calendar components:unitFlags fromDate:[NSDate date]];
    int year=[comps year];
    int week = [comps weekday];
    int month = [comps month];
    int day = [comps day];
    int hour = [comps hour];
    int min = [comps minute];
    int sec = [comps second];
    
    NSArray * arrWeek=[NSArray arrayWithObjects:@"星期日",@"星期一",@"星期二",@"星期三",@"星期四",@"星期五",@"星期六", nil];
    return [arrWeek objectAtIndex:[comps weekday] - 1];
}



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
                                            textFont:(UIFont *)font {
    // 设置段落
    NSMutableParagraphStyle * paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = lineSpacing;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    // NSKernAttributeName字体间距
    NSDictionary *attributes = @{ NSParagraphStyleAttributeName:paragraphStyle,NSKernAttributeName:@0.5f};
    NSMutableAttributedString * attriStr = [[NSMutableAttributedString alloc] initWithString:self attributes:attributes];
    // 创建文字属性
    NSDictionary * attriBute = @{NSForegroundColorAttributeName:textcolor,NSFontAttributeName:font};
    [attriStr addAttributes:attriBute range:NSMakeRange(0, self.length)];
    return attriStr;
}



/**
 *  计算富文本字体高度
 *
 *  @param lineSpeace 行高
 *  @param font       字体
 *  @param width      字体所占宽度
 *
 *  @return 富文本高度
 */
-(CGFloat)getSpaceLabelHeightwithSpeace:(CGFloat)lineSpeace withFont:(UIFont*)font withWidth:(CGFloat)width {
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.alignment = NSTextAlignmentCenter;
    /** 行高 */
    paraStyle.lineSpacing = lineSpeace;
    // NSKernAttributeName字体间距
    NSDictionary *dic = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@0.5f
                          };
    CGSize size = [self boundingRectWithSize:CGSizeMake(width,MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:dic context:nil].size;
    return size.height;
}



/**
 判断手机号

手机号
 @return <#return value description#>
 */
- (BOOL)checkTelNumber {
    NSString *pattern = @"^1+[3578]+\\d{9}";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", pattern];
    BOOL isMatch = [pred evaluateWithObject:self];
    return isMatch;
}


@end
