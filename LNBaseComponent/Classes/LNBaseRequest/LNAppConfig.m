//
//  LNAppConfig.m
//  LNBusinessComponent_Example
//
//  Created by 尹亚坤 on 2018/12/14.
//  Copyright © 2018 yinyakun. All rights reserved.
//

#import "LNAppConfig.h"

@interface LNAppConfig ()

@property (nonatomic, copy,readwrite)NSString * appKey;
@property (nonatomic, copy,readwrite)NSString * baseURL;

@property (nonatomic, copy,readwrite)NSString * clientId;
@property (nonatomic, copy,readwrite)NSString * clientSecret;
@property (nonatomic, copy,readwrite)NSString * appEndId;

@property (nonatomic, copy,readwrite)NSString * RSAPublicKey;
@property (nonatomic, copy,readwrite)NSString * packageId;
@property (nonatomic, copy,readwrite)NSString * routeId;
@property (nonatomic, copy,readwrite)NSString * PWDRSAPublicKey;


@end

@implementation LNAppConfig

+ (instancetype)shareInstance{
    static LNAppConfig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [LNAppConfig new];
        [instance loadConfig];
    });
    return instance;
}
- (void)loadConfig{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"LNUAppConfig.plist" ofType:nil];
    if (!path) {
        NSLog(@"请创建plist 文件,配置APP 再使用");
        return;
    }
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:path];
    NSLog(@"%@",dict);
    NSDictionary *UAPPConfigDict = [dict objectForKey:@"UAPPConfig"];
    self.appKey = [UAPPConfigDict objectForKey:@"appKey"];
    self.baseURL = [UAPPConfigDict objectForKey:@"baseURL"];
    self.clientId = [UAPPConfigDict objectForKey:@"clientId"];
    self.clientSecret = [UAPPConfigDict objectForKey:@"clientSecret"];
    self.appEndId = [UAPPConfigDict objectForKey:@"appEndId"];

    self.RSAPublicKey = [UAPPConfigDict objectForKey:@"rSAPublicKey"];
    self.packageId = [UAPPConfigDict objectForKey:@"packageId"];
    self.PWDRSAPublicKey = [UAPPConfigDict objectForKey:@"pWDRSAPublicKey"];

}
@end
