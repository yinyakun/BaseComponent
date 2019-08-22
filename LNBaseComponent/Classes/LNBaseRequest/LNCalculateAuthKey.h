//
//  LNCalculateAuthKey.h
//  AFNetworking
//
//  Created by 尹亚坤 on 2018/12/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNCalculateAuthKey : NSObject
+ (instancetype)shareHelper;
/**
 计算AuthKey

 @param publicKey 公钥
 @param token 登陆后的token
 @param packageID packageID
 @param routeKey 路由ID, 这个地方不用填写.直接 nil 就可以.
 @return AuthKey
 */
//- (NSString *)calculateAuthKeyWithRSAPublicKey:(NSString *)publicKey token:(NSString*)token packageID:(NSString *)packageID andRouteKey:(NSString *)routeKey;
- (NSString *)calculateAuthKeyWithRSAPublicKey:(NSString *)publicKey token:(NSString*)token packageID:(NSString *)packageID andRouteKey:(NSString *)routeKey appKey:(NSString *)appKey;
/**
 AuthKey 新的计算方法

 @param appKey appkey
 @param secret appsecret
 @param clientId clientId
 @return authKey
 */
- (NSString *)calculateAuthKeyAppKey:(NSString *)appKey appSecret:(NSString*)secret clientId:(NSString *)clientId;

@end

NS_ASSUME_NONNULL_END
