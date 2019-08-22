//
//  LNWKWebViewController.h
//  LNBaseComponent_Example
//
//  Created by 尹亚坤 on 2019/2/27.
//  Copyright © 2019 yinyakun. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "LNWKObject.h"
NS_ASSUME_NONNULL_BEGIN

@interface LNWKWebViewController : UIViewController
@property (nonatomic,copy)NSString* requestURL;
@property (nonatomic,strong)WKWebView *webView;
@property (nonatomic,strong)NSDictionary *userInfo;

@property (nonatomic,assign)BOOL needProgress;
@property (nonatomic,assign)CGRect progressRect;
- (instancetype)init __attribute__((unavailable("请使用initWithCancelWebViewLongPress:")));
+ (instancetype)new __attribute__((unavailable("请使用initWithCancelWebViewLongPress:")));

/**
 初始化控制器,替代 init方法

 @param cancelPressStatus 是否取消长按手势
 @return 返回控制器
 */
- (instancetype)initWithCancelWebViewLongPress:(BOOL)cancelPressStatus;

/**
 取消系统webview 的长按手势 状态
 */
@property (nonatomic,assign,readonly)BOOL cancelWebViewLongPress;


/**
 原生注册方法列表,JS 调用 原生.
 */
@property (nonatomic,strong)NSMutableArray<LNWKObject *> *jsCallNativeMethods;


/**
 原生调用JS 的方法, 原生调用JS.
 */
- (void)nativeCallJSMethod:(LNWKObject *)callObject;

@end

NS_ASSUME_NONNULL_END
