//
//  LNBaseRequest.h
//  LNUApp
//
//  Created by 尹亚坤 on 2018/9/7.
//  Copyright © 2018年 lenovo. All rights reserved.
//

#import <YTKNetwork/YTKNetwork.h>

@interface LNBaseRequest : YTKRequest
@property (nonatomic, copy,readonly)NSString * token;
@property (nonatomic, copy,readonly)NSString *SAppKey;
@property (nonatomic, copy,readonly)NSString *SbaseURL;

@property (nonatomic, copy,readonly)NSString *SclientId;
@property (nonatomic, copy,readonly)NSString *SclientSecret;
@property (nonatomic, copy,readonly)NSString *appEndId;

@property (nonatomic, copy,readonly)NSString *SRSAPublickey;
@property (nonatomic, copy,readonly)NSString *SPackageId;
@property (nonatomic, copy,readonly)NSString *SRouteId;

@property (nonatomic, copy) YTKRequestCompletionBlock _Nullable ln_successBlock;
@property (nonatomic, copy) YTKRequestCompletionBlock _Nullable ln_failedBlock;

/**
 网络请求
 登陆或者登录前 调用这个方法
 @param success 成功回调
 @param failure 失败回调
 */
- (void)ln_startWithCompletionBlockWithSuccess:(nullable YTKRequestCompletionBlock)success failure:(nullable YTKRequestCompletionBlock)failure;

/**
登录成功后的请求 调用这个方法

 @param token 登录返回的token
 @param success 成功的回调
 @param failure 失败回调
 */
- (void)ln_startWithToken:(NSString *)token completionBlockWithSuccess:(nullable YTKRequestCompletionBlock)success failure:(nullable YTKRequestCompletionBlock)failure;

@end
