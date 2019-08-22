//
//  LNWebViewProgressHud.h
//  LNUniversalApplication
//
//  Created by 尹亚坤 on 2019/8/2.
//  Copyright © 2019 lenovo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface LNWebViewProgressHud : UIView

- (instancetype)initWithFrame:(CGRect)frame andWebView:(WKWebView *)webView;

/**
 手动 强制隐藏, 一般无需调用.
 */
- (void)hiddenHud;
@end

NS_ASSUME_NONNULL_END
