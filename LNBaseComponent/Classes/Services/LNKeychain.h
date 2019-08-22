//
//  LNKeychain.h
//  Portal
//
//  Created by 陈擎霄 on 2017/10/24.
//  Copyright © 2017年 Lenovo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LNKeychain : NSObject

+ (void)save:(NSString *)service data:(id)data;
+ (id)load:(NSString *)service;
+ (void)delete:(NSString *)service;


@end
