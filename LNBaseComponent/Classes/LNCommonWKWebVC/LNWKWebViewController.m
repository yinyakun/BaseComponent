//
//  LNWKWebViewController.m
//  LNBaseComponent_Example
//
//  Created by 尹亚坤 on 2019/2/27.
//  Copyright © 2019 yinyakun. All rights reserved.
//

#import "LNWKWebViewController.h"
#import "WebViewJavascriptBridge.h"
#import "LNWebViewProgressHud.h"

@interface LNWKWebViewController ()<WKUIDelegate,WKNavigationDelegate>
@property (nonatomic,strong)WebViewJavascriptBridge *bridge;
@property (nonatomic,assign,readwrite)BOOL cancelWebViewLongPress;
@property (nonatomic,strong)LNWebViewProgressHud *progressHud;

@end

@implementation LNWKWebViewController

- (instancetype)initWithCancelWebViewLongPress:(BOOL)pressStatus{
    self = [super init];
    if (self) {
        _cancelWebViewLongPress = pressStatus;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    if (self.needProgress && ![self.view.subviews containsObject:self.progressHud]) {
        [self.view addSubview:self.progressHud];
    }else{
        if ([self.view.subviews containsObject:self.progressHud]) {
            [self.progressHud removeFromSuperview];
        }
    }
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)initUI{
    [self.view addSubview:self.webView];
    // 需要提前初始化 bridge.
    [self bridge];
    [self excuteJSCallNativeWithBridge:self.bridge];
    if (!self.requestURL) {
        return;
    }
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.requestURL]];
    [self.webView loadRequest:request];
}

- (void)setNeedProgress:(BOOL)needProgress{
    _needProgress = needProgress;
}

- (void)nativeCallJSMethod:(LNWKObject *)callObject{
    if (!callObject) {
        return;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self excuteJSWithBridge:self.bridge wkObject:callObject];
    });
}
/**
 native 调用js 方法,并传值到js
 JS 中会 有方法注册,调用的方法 是:
    bridge.registerHandler('JSMethod', function(data, responseCallback) {
            responseCallback({"data1":data,"info":"原生传输数据到JS,JS收到数据了,并把收到的数据返回"})
        })

 @param bridge 桥
 */
- (void)excuteJSWithBridge:(WebViewJavascriptBridge *)bridge wkObject:(LNWKObject *)callM{
    [bridge callHandler:callM.methodName data:callM.data responseCallback:^(id responseData) {
        callM.cbResponse(responseData);
    }];
}

/**
 js 调用原生的方法,原生要注册该方法,并传值给原生,
 该方法也可以用于JS 获取原生里面的数据.用于数据传递.

 @param bridge 桥
 */
- (void)excuteJSCallNativeWithBridge:(WebViewJavascriptBridge*)bridge{

    for (int i = 0; i < self.jsCallNativeMethods.count; i++) {
        LNWKObject *callM = self.jsCallNativeMethods[i];
        [bridge registerHandler:callM.methodName handler:^(id data, WVJBResponseCallback responseCallback) {
            callM.jsCallCbResponse(data, responseCallback);
        }];
    }
}

- (WKWebView *)webView{
    if (_webView) {
        return _webView;
    }
    if (self.cancelWebViewLongPress) {
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        _webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
    }else{
        NSString *css = @"body{-webkit-user-select:none;-webkit-user-drag:none;}";
            // CSS选中样式取消
        NSMutableString *javascript = [NSMutableString string];
        [javascript appendString:@"var style = document.createElement('style');"];
        [javascript appendString:@"style.type = 'text/css';"];
        [javascript appendFormat:@"var cssContent = document.createTextNode('%@');", css];
        [javascript appendString:@"style.appendChild(cssContent);"];
        [javascript appendString:@"document.body.appendChild(style);"];

            // javascript注入
        WKUserScript *noneSelectScript = [[WKUserScript alloc] initWithSource:javascript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
        WKUserContentController *userContentController = [[WKUserContentController alloc] init];
        [userContentController addUserScript:noneSelectScript];
        WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
        configuration.userContentController = userContentController;
        _webView = [[WKWebView alloc] initWithFrame:self.view.frame configuration:configuration];
    }
    _webView.navigationDelegate = self;
    return _webView;
}

- (NSMutableArray<LNWKObject *> *)jsCallNativeMethods{
    if (_jsCallNativeMethods) {
        return _jsCallNativeMethods;
    }
    _jsCallNativeMethods = [[NSMutableArray alloc] init];
    LNWKObject *object = [[LNWKObject alloc] init];
    object.methodName = @"getUserInfo";
    __weak typeof(self) weakSelf = self;
    object.jsCallCbResponse = ^(id object, callback cb) {
        cb(weakSelf.userInfo);
    };
    [_jsCallNativeMethods addObject:object];
    return _jsCallNativeMethods;
}

- (WebViewJavascriptBridge *)bridge{
    if (_bridge) {
        return _bridge;
    }
    WebViewJavascriptBridge *bridge = [self bridgeForWebView:self.webView];
    [bridge setWebViewDelegate:self];
    _bridge = bridge;
    return _bridge;
}

- (WebViewJavascriptBridge*)bridgeForWebView:(id)webView {
    WebViewJavascriptBridge* bridge = [WebViewJavascriptBridge bridgeForWebView:webView];
    return bridge;
}
#pragma mark - getter and setter

- (LNWebViewProgressHud *)progressHud{
    if (_progressHud) {
        return _progressHud;
    }
    UIView *wkcontentView;
    for (int i = 0; i < self.webView.scrollView.subviews.count; i++) {
        UIView *temp = self.webView.scrollView.subviews[i];
        if ([[temp class] isSubclassOfClass:NSClassFromString(@"WKContentView")]) {
            wkcontentView = temp;
            break;
        }
    }
    _progressHud = [[LNWebViewProgressHud alloc] initWithFrame:self.progressRect andWebView:self.webView];
    return _progressHud;
}


- (void)dealloc{
    NSLog(@"释放了");
}


@end
