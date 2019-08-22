//
//  NSDate+LNAddtion.h
//  Portal
//
//  Created by 陈擎霄 on 2017/11/28.
//  Copyright © 2017年 Lenovo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (LNAddtion)

/// 获取当前时间的时间戳(10位)
+ (NSString *)getCurrentTimestamp;

/// 时间戳转成NSDate
+ (NSDate *)dateWithTimestampString:(NSString *)timestampString;

/// 时间转化成格式化显示文字(dateFormaterString，如 YYYY-MM-dd hh:mm:ss)
- (NSString *)stringWithCustomString:(NSString *)dateFormaterString;

/// 自定义时间输出
- (NSString *)customShow;

/// 消息列表时间输出
- (NSString *)messageCustomShow;

/// 通知列表自定义时间输出
- (NSString *)notificationCustomShow;

/// 是否在今天
- (BOOL)isToday_LN;

/// 是否在昨天
- (BOOL)isYesterday_LN;

/// 是否在同一周内
- (BOOL)isSameWeek;

/// 是否在今年
- (BOOL)isThisYear;

/// 根据日期返回星期几
- (NSString *)weekString;

@end

