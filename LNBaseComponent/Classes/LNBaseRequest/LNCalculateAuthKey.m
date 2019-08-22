    //
    //  LNCalculateAuthKey.m
    //  AFNetworking
    //
    //  Created by 尹亚坤 on 2018/12/12.
    //

#import "LNCalculateAuthKey.h"
#import "RSA.h"
#import <CommonCrypto/CommonCrypto.h>

@interface LNCalculateAuthKey ()
@property (nonatomic, copy)NSString * publicKey;
@property (nonatomic, copy)NSString * token;
@property (nonatomic, copy)NSString * packageID;
@property (nonatomic, copy)NSString * routeKey;
@property (nonatomic, copy)NSString * appKey;

@end

@implementation LNCalculateAuthKey
+ (instancetype)shareHelper{
    static LNCalculateAuthKey *helper = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (helper == nil) {
            helper = [[self alloc] init];
        }
    });
    return helper;
}
- (NSString *)calculateAuthKeyWithRSAPublicKey:(NSString *)publicKey token:(NSString*)token packageID:(NSString *)packageID andRouteKey:(NSString *)routeKey appKey:(NSString *)appKey{
    if (!publicKey || !packageID || !token) {
        NSLog(@"publicKey 或者 packageID 或者 token 不能为空.");
        return nil;
    }
    if (publicKey) {
        self.publicKey = publicKey;
        self.packageID = packageID;
        self.routeKey  = routeKey;
        self.appKey    = appKey;
        return [self calcAuthKeyByRSAWithToken:token];
    }else{
        NSLog(@"publicKey 不能为空");
        return nil;
    }
}
- (NSString *)calcAuthKeyByRSAWithToken:(NSString *)token{
    NSString *strToken = token;
    NSString *publicKey = self.publicKey;
    NSString *strTime =[LNCalculateAuthKey getNowTimeTimestamp3];
    NSString *strTokenAndNow = [NSString stringWithFormat:@"%@::%@",strToken,strTime];
    NSString *strResult = [RSA encryptString:strTokenAndNow publicKey:publicKey];
    NSString *strResultPackageID = [NSString stringWithFormat:@"%@@%@::%@",@"c07e21873169f92e",strResult,self.appKey];
    return strResultPackageID;
}

/**
 AuthKey 新的计算方法

 @param appKey appkey
 @param secret appsecret
 @param clientId clientId
 @return authKey
 */
- (NSString *)calculateAuthKeyAppKey:(NSString *)appKey appSecret:(NSString*)secret clientId:(NSString *)clientId{
    NSString *strTime =[LNCalculateAuthKey getNowTimeTimestamp3];
    NSString *md5Resource = [NSString stringWithFormat:@"%@%@AT%@",clientId,secret,strTime];
    NSString *md5Result = [self md5:md5Resource];
    NSString *returnStr = [NSString stringWithFormat:@"%@.%@",md5Result,strTime];
    return returnStr;
}

+(NSString *)getNowTimeTimestamp3{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss SSS"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
                                                          //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]*1000];
    return timeSp;
}

+(NSString *)getNowTimeTimestamp{
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init] ;
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"]; // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
                                                      //设置时区,这个对于时间的处理有时很重要
    NSTimeZone* timeZone = [NSTimeZone timeZoneWithName:@"Asia/Shanghai"];
    [formatter setTimeZone:timeZone];
    NSDate *datenow = [NSDate date];//现在时间,你可以输出来看下是什么格式
    NSString *timeSp = [NSString stringWithFormat:@"%ld", (long)[datenow timeIntervalSince1970]];
    return timeSp;
}

- (NSString *) md5:(NSString *) str
{
    NSString *md5Str = [self md5HashToLower32BitWithStr:str];

    NSString *string;
    for (int i=0; i<24; i++) {
        string=[md5Str substringWithRange:NSMakeRange(8, 16)];
    }

    return string;
}

- (NSString *)md5HashToLower32BitWithStr:(NSString *)str {
    const char *input = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(input, (CC_LONG)strlen(input), result);

    NSMutableString *digest = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for (NSInteger i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        [digest appendFormat:@"%02x", result[i]];
    }
    return digest;
}

@end
