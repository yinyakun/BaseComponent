    //
    //  LNBaseRequest.m
    //  LNUApp
    //
    //  Created by 尹亚坤 on 2018/9/7.
    //  Copyright © 2018年 lenovo. All rights reserved.
    //

#import "LNBaseRequest.h"
#import "LNCalculateAuthKey.h"
#import "LNAppConfig.h"

@interface LNBaseRequest ()
@property (nonatomic, copy,readwrite)NSString * token;
@property (nonatomic, copy,readwrite)NSString *SAppKey;
@property (nonatomic, copy,readwrite)NSString *SbaseURL;

@property (nonatomic, copy,readwrite)NSString *SclientId;
@property (nonatomic, copy,readwrite)NSString *SclientSecret;
@property (nonatomic, copy,readwrite)NSString *appEndId;

@property (nonatomic, copy,readwrite)NSString *SRSAPublickey;
@property (nonatomic, copy,readwrite)NSString *SPackageId;
@property (nonatomic, copy,readwrite)NSString *SRouteId;

@property (nonatomic,assign)BOOL beforeLogin;


@end

@implementation LNBaseRequest

- (instancetype)init{
    self = [super init];
    if (self) {
        _beforeLogin = YES;
        [self configBaseRequest];
    }
    return self;
}

- (NSString *)baseUrl{
    [self configBaseRequest];
    return self.SbaseURL;
}

- (void)configBaseRequest{
    self.SAppKey      = [[LNAppConfig shareInstance] appKey];
    self.SbaseURL     = [[LNAppConfig shareInstance] baseURL];
    self.SclientId    = [[LNAppConfig shareInstance] clientId];
    self.SclientSecret    = [[LNAppConfig shareInstance] clientSecret];

    self.appEndId     = [[LNAppConfig shareInstance] appEndId];

    self.SRSAPublickey = [[LNAppConfig shareInstance] RSAPublicKey];
    self.SPackageId = [[LNAppConfig shareInstance] packageId];
    self.SRouteId = [[LNAppConfig shareInstance] routeId];

}

- (void)ln_startWithCompletionBlockWithSuccess:(YTKRequestCompletionBlock)success failure:(YTKRequestCompletionBlock)failure {
    self.ln_successBlock = success;
    self.ln_failedBlock = failure;
    self.beforeLogin = YES;
    [self startWithCompletionBlockWithSuccess:^(__kindof YTKBaseRequest * _Nonnull request) {
        if ((request.responseJSONObject == nil) || ([request.responseJSONObject valueForKey:@"code"] == nil)) {
            failure(request);
        }
        NSInteger customStatueCode = [[request.responseJSONObject valueForKey:@"code"] integerValue];
        if (customStatueCode == 200) {
                // 成功
            success(request);
        }else {
            failure(request);
        }
    } failure:^(__kindof YTKBaseRequest * _Nonnull request) {
        failure(request);
    }];

}

- (void)ln_startWithToken:(NSString *)token completionBlockWithSuccess:(nullable YTKRequestCompletionBlock)success failure:(nullable YTKRequestCompletionBlock)failure{
    if (token) {
        self.token = token;
        self.beforeLogin = NO;
    }
    [self ln_startWithCompletionBlockWithSuccess:success failure:failure];
}

- (NSDictionary<NSString *,NSString *> *)requestHeaderFieldValueDictionary{
    [self configBaseRequest];
    NSString *authKey;
    if (!self.token) {
        authKey = [[LNCalculateAuthKey shareHelper] calculateAuthKeyAppKey:self.SAppKey appSecret:self.SclientSecret clientId:self.SclientId];
    }else{
        authKey = [[LNCalculateAuthKey shareHelper] calculateAuthKeyWithRSAPublicKey:self.SRSAPublickey  token:self.token packageID:self.SPackageId andRouteKey:self.SRouteId appKey:self.SAppKey];
    }
    return @{
             @"MSP-AuthKey":authKey,
             @"MSP-AppKey":self.SAppKey,
             };
}

- (void)networkError{

}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
