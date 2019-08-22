//
//  NSDate+LNAddtion.m
//  Portal
//
//  Created by 陈擎霄 on 2017/11/28.
//  Copyright © 2017年 Lenovo. All rights reserved.
//

#import "NSDate+LNAddtion.h"

@implementation NSDate (LNAddtion)

+ (NSString *)getCurrentTimestamp {
    NSDate *nowDate = [NSDate date];
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[nowDate timeIntervalSince1970]];
    return timeSp;
}

+ (NSDate *)dateWithTimestampString:(NSString *)timestampString {
    
    NSTimeInterval timeInterval;
    if (timestampString.length == 10) {
        // 10位时间戳
        timeInterval = [timestampString longLongValue];
    }else if (timestampString.length == 13) {
        // 13位时间戳
        timeInterval = [timestampString longLongValue]/1000;
    }else {
        timeInterval = [timestampString longLongValue];
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:timeInterval];
    return date;
}

- (NSString *)stringWithCustomString:(NSString *)dateFormaterString {
    
    if (dateFormaterString.length == 0) {
        dateFormaterString = @"yyyy-MM-dd HH:mm:ss";
    }
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.timeZone = [NSTimeZone localTimeZone];
    
    //设定时间格式,这里可以设置成自己需要的格式
    [dateFormatter setDateFormat:dateFormaterString];
    //用[NSDate date]可以获取系统当前时间
    NSString *currentDateStr = [dateFormatter stringFromDate:self];
    
    return currentDateStr;
}

- (NSString *)customShow {
    // 当天显示 今天 HH:mm
    if ([self isThisYear]) {
        // 同一年 HH:mm
        return [NSString stringWithFormat:@"%@",[self stringWithCustomString:@"MM月dd日"]];
    }else {
        // 七天以外，yyyy-MM-dd HH:mm
        return [self stringWithCustomString:@"yyyy年MM月dd日"];
    }
}

- (NSString *)messageCustomShow {
    // 当天显示 今天 HH:mm
    if ([self isToday_LN]) {
        return [NSString stringWithFormat:@"%@",[self stringWithCustomString:@"HH:mm"]];
    }else if ([self isYesterday_LN]) {
        // 昨天显示 昨天 HH:mm
        return [NSString stringWithFormat:@"昨天"];
    }else if ([self isSameWeek]) {
        // 同一周 星期几 HH:mm
        return [NSString stringWithFormat:@"%@",[self weekString]];
    }else {
        // 七天以外，yyyy-MM-dd HH:mm
        return [self stringWithCustomString:@"yyyy/MM/dd"];
    }
}

- (NSString *)notificationCustomShow {
    
    if ([self isToday_LN]) {
        return [NSString stringWithFormat:@"%@",[self stringWithCustomString:@"HH:mm"]];
    }else if ([self isYesterday_LN]) {
        // 昨天显示 昨天 HH:mm
        return [NSString stringWithFormat:@"昨天 %@",[self stringWithCustomString:@"HH:mm"]];
    }else if ([self isSameWeek]) {
        // 同一周 星期几 HH:mm
        return [NSString stringWithFormat:@"%@ %@",[self weekString],[self stringWithCustomString:@"HH:mm"]];
    }else if ([self isThisYear]) {
        // 同一年 HH:mm
        return [NSString stringWithFormat:@"%@",[self stringWithCustomString:@"MM月dd日 HH:mm"]];
    }else {
        // 七天以外，yyyy-MM-dd HH:mm
        return [self stringWithCustomString:@"yyyy年MM月dd日 HH:mm"];
    }
}

- (BOOL)isToday_LN {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear ;
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    //2.获得self
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.day == nowCmps.day);
}

- (BOOL)isYesterday_LN {
    /// 加上一天的时间
    NSTimeInterval aTimeInterval = [self timeIntervalSinceReferenceDate] + 86400;
    NSDate *newDate = [NSDate dateWithTimeIntervalSinceReferenceDate:aTimeInterval];
    return [newDate isToday_LN];
}

- (BOOL)isSameWeek {
    
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitWeekOfMonth | NSCalendarUnitWeekday | NSCalendarUnitMonth | NSCalendarUnitYear ;
    
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    //2.获得self
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return (selfCmps.year == nowCmps.year) && (selfCmps.month == nowCmps.month) && (selfCmps.weekOfMonth == nowCmps.weekOfMonth);
}

- (BOOL)isThisYear {
    NSCalendar *calendar = [NSCalendar currentCalendar];
    int unit = NSCalendarUnitYear ;
    
    //1.获得当前时间的 年月日
    NSDateComponents *nowCmps = [calendar components:unit fromDate:[NSDate date]];
    
    //2.获得self
    NSDateComponents *selfCmps = [calendar components:unit fromDate:self];
    
    return selfCmps.year == nowCmps.year;
}

- (NSString *)weekString {
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期天", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSTimeZone *timeZone = [NSTimeZone localTimeZone];
    [calendar setTimeZone: timeZone];
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:self];
    
    return [weekdays objectAtIndex:theComponents.weekday];
    
}

@end

