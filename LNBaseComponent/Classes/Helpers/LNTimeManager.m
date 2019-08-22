//
//  LNTimeManager.m
//  Portal
//
//  Created by yakun yin on 2017/9/18.
//  Copyright © 2017年 Lenovo. All rights reserved.
//

#import "LNTimeManager.h"

@implementation LNTimeManager

+ (instancetype)shareInstance {
    static id shareInstance = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[self alloc] init];
    });
    
    return shareInstance;
}

/**
 时间转时间戳,

 @param timeString 时间字符串
 @return 时间戳
 */
- (NSString *)timeWithTimeIntervalString:(NSString *)timeString
{
    if (!timeString.length) {
        return @"未知";
    }
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]/ 1000.0];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

/**
 时间转时间戳

 @param timeString 时间字符串
 @return 时间戳
 */
- (NSString *)timeWithTimeIntervalString1:(NSString *)timeString
{
    if (!timeString.length) {
        return @"未知";
    }
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy.MM.dd"];
    
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}
- (NSString *)timeTypeYYYYMMDDWithTimeIntervalString:(NSString *)timeString{
    if (!timeString.length) {
        return @"未知";
    }
    // 格式化时间
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"yyyy.MM.dd"];
    // 毫秒值转化为秒
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:[timeString doubleValue]];
    NSString* dateString = [formatter stringFromDate:date];
    return dateString;
}

//0：00—6:00凌晨,
//6:00—11:00上午，
//11:00—13:00中午，
//13:00—16:00下午，
//16:00—18:00傍晚，
//18:00—24:00晚上
-(NSString *)currentTime{
    NSString *time;
    BOOL isLC = [self judgeTimeByStartAndEnd:@"00:00" withExpireTime:@"06:00"];
    BOOL isAM = [self judgeTimeByStartAndEnd:@"06:00" withExpireTime:@"11:00"];
    BOOL isMM = [self judgeTimeByStartAndEnd:@"11:00" withExpireTime:@"13:00"];
    BOOL isPM = [self judgeTimeByStartAndEnd:@"13:00" withExpireTime:@"16:00"];
    BOOL isBW = [self judgeTimeByStartAndEnd:@"16:00" withExpireTime:@"18:00"];
    BOOL isMN = [self judgeTimeByStartAndEnd:@"18:00" withExpireTime:@"23:59"];
    NSString *innertime;
    if (isLC) {
        innertime = @"凌晨";
    }
    if (isAM) {
        innertime = @"上午";
    }
    if (isMM) {
        innertime = @"中午";
    }
    if (isPM) {
        innertime = @"下午";
    }
    if (isBW) {
        innertime = @"傍晚";
    }
    if (isMN) {
        innertime = @"晚上";
    }
    time = [NSString stringWithFormat:@"%@",innertime];
    return time;
}

- (BOOL)judgeTimeByStartAndEnd:(NSString *)startTime withExpireTime:(NSString *)expireTime {
    NSDate *today = [NSDate date];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
        // 时间格式,此处遇到过坑,建议时间HH大写,手机24小时进制和12小时禁止都可以完美格式化
    [dateFormat setDateFormat:@"HH:mm"];
    NSString * todayStr=[dateFormat stringFromDate:today];//将日期转换成字符串
                                                          //    NSString * todayStr = @"10:59";
    today=[ dateFormat dateFromString:todayStr];//转换成NSDate类型。日期置为方法默认日期
                                                //startTime格式为 02:22   expireTime格式为 12:44
    NSDate *start = [dateFormat dateFromString:startTime];
    NSDate *expire = [dateFormat dateFromString:expireTime];

    if (([today compare:start] == NSOrderedDescending || [today compare:start] == NSOrderedSame )&& [today compare:expire] == NSOrderedAscending) {
        return YES;
    }
    return NO;
}

@end
