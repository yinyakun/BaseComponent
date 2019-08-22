//
//  LNWKObject.h
//  LNBaseComponent_Example
//
//  Created by 尹亚坤 on 2019/2/27.
//  Copyright © 2019 yinyakun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^callback)(id object);
typedef void(^registerCallback)(id object,callback cb);

@interface LNWKObject : NSObject
@property (nonatomic,copy)NSString *methodName;

/**
 原生调用JS , 原生给JS 传的值
 */
@property (nonatomic,strong)id data;

/**
 原生调用JS , JS 返回数据给原生通过 这个回调里面取值.
 */
@property (nonatomic,copy) callback cbResponse;

/**
 js 调用原生需要这个值
 */
@property (nonatomic,copy) registerCallback jsCallCbResponse;

@end
