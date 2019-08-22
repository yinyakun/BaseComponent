//
//  LNAppConfig.h
//  LNBusinessComponent_Example
//
//  Created by 尹亚坤 on 2018/12/14.
//  Copyright © 2018 yinyakun. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNAppConfig : NSObject
+ (instancetype)shareInstance;
@property (nonatomic, copy,readonly)NSString * appKey;
@property (nonatomic, copy,readonly)NSString * baseURL;

@property (nonatomic, copy,readonly)NSString * clientId;
@property (nonatomic, copy,readonly)NSString * clientSecret;
@property (nonatomic, copy,readonly)NSString * appEndId;

@property (nonatomic, copy,readonly)NSString * RSAPublicKey;
@property (nonatomic, copy,readonly)NSString * packageId;
@property (nonatomic, copy,readonly)NSString * routeId;

@property (nonatomic, copy,readonly)NSString * PWDRSAPublicKey;

@end

NS_ASSUME_NONNULL_END
