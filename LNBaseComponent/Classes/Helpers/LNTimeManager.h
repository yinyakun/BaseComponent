//
//  LNTimeManager.h
//  Portal
//
//  Created by yakun yin on 2017/9/18.
//  Copyright © 2017年 Lenovo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNTimeManager : NSObject
+ (instancetype)shareInstance;


/**
 时间戳 转 成 时间格式 yyyy年MM月dd日 HH:mm:ss

 @param timeString 时间戳
 @return 时间
 */
- (NSString *)timeWithTimeIntervalString:(NSString *)timeString;
- (NSString *)timeWithTimeIntervalString1:(NSString *)timeString DEPRECATED_ATTRIBUTE;
- (NSString *)timeTypeYYYYMMDDWithTimeIntervalString:(NSString *)timeString;

/**
 获取当前时间 是凌晨/上午/中午/下午/傍晚/晚上

 @return @"凌晨/上午/中午/下午/傍晚/晚上"
 */
-(NSString *)currentTime;
@end
