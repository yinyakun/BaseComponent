//
//  LNWebViewProgressHud.m
//  LNUniversalApplication
//
//  Created by 尹亚坤 on 2019/8/2.
//  Copyright © 2019 lenovo. All rights reserved.
//

#import "LNWebViewProgressHud.h"

@interface LNWebViewProgressHud()
@property (nonatomic,strong)WKWebView *webView;
@property (nonatomic, strong) UIProgressView *myProgressView;
@property (nonatomic,strong)CAGradientLayer * gradientLayer;
@property (nonatomic,assign)CGRect originalRect;
@end

@implementation LNWebViewProgressHud
- (instancetype)initWithFrame:(CGRect)frame andWebView:(WKWebView *)webView{
    self = [super initWithFrame:frame];
    if (self) {
        _originalRect = frame;
        _webView = webView;
        [self initUI];
        [_webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}

- (void)initUI{
    [self addSubview:self.myProgressView];
}

#pragma mark - event response
    // 计算wkWebView进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (object == self.webView && [keyPath isEqualToString:@"estimatedProgress"]) {
        CGFloat newprogress = [[change objectForKey:NSKeyValueChangeNewKey] doubleValue];
        self.myProgressView.alpha = 1.0f;
        [self.myProgressView setProgress:newprogress animated:YES];
        self.gradientLayer.frame = CGRectMake(0, 0, self.originalRect.size.width * newprogress, 2);
        if (newprogress >= 1.0f) {
            [UIView animateWithDuration:0.3f
                                  delay:0.3f
                                options:UIViewAnimationOptionCurveEaseOut
                             animations:^{
                                 self.myProgressView.alpha = 0.0f;
                             }
                             completion:^(BOOL finished) {
                                 [self.myProgressView setProgress:0 animated:NO];
                             }];
        }

    } else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)hiddenHud{
    self.myProgressView.alpha = 1.0f;
    [self.myProgressView setProgress:1 animated:YES];
    self.gradientLayer.frame = CGRectMake(0, 0, self.originalRect.size.width * 1, 2);
    [UIView animateWithDuration:0.3f
                          delay:0.3f
                        options:UIViewAnimationOptionCurveEaseOut
                     animations:^{
                         self.myProgressView.alpha = 0.0f;
                     }
                     completion:^(BOOL finished) {
                         [self.myProgressView setProgress:0 animated:NO];
                     }];
}

#pragma mark - getter and setter
- (UIProgressView *)myProgressView
{
    if (_myProgressView == nil) {
        _myProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0,0, self.originalRect.size.width, 2)];
        _myProgressView.tintColor = [UIColor whiteColor];
        _myProgressView.trackTintColor = [UIColor whiteColor];
        CAGradientLayer * gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = CGRectMake(0, 0, self.originalRect.size.width * 0.1, 2);
        UIColor *beginColor = [LNWebViewProgressHud colorWithHEX:@"#1A85DF"];
        UIColor *endColor = [LNWebViewProgressHud colorWithHEX:@"#59FFFD"];
        gradientLayer.colors = @[(__bridge id)beginColor.CGColor,(__bridge id)endColor.CGColor];
        gradientLayer.startPoint = CGPointMake(0, 0);
        gradientLayer.endPoint = CGPointMake(1, 0);
        _gradientLayer = gradientLayer;
        [_myProgressView.layer addSublayer:gradientLayer];
    }

    return _myProgressView;
}

- (void)dealloc{
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
    NSLog(@"%s",__FUNCTION__);
}

+ (UIColor *)colorWithHEX: (NSString *)HEXColorStr alpha:(CGFloat)alphaValue
{
    unsigned int red,green,blue;
    NSRange range;
    range.length = 2;

    range.location = 1;
    [[NSScanner scannerWithString:[HEXColorStr substringWithRange:range]] scanHexInt:&red];

    range.location = 3;
    [[NSScanner scannerWithString:[HEXColorStr substringWithRange:range]] scanHexInt:&green];

    range.location = 5;
    [[NSScanner scannerWithString:[HEXColorStr substringWithRange:range]] scanHexInt:&blue];

    return [UIColor colorWithRed:(float)(red/255.0f) green:(float)(green / 255.0f) blue:(float)(blue / 255.0f) alpha:alphaValue];
}

+ (UIColor *)colorWithHEX: (NSString *)HEXColorStr{
    return [self colorWithHEX:HEXColorStr alpha:1.f];
}
@end
