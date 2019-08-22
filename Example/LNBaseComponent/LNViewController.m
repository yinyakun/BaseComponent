//
//  LNViewController.m
//  LNBaseComponent
//
//  Created by yinyakun on 12/07/2018.
//  Copyright (c) 2018 yinyakun. All rights reserved.
//

#import "LNViewController.h"
//#import "LNWKWebViewController.h"
//#import "LNWKObject.h"
#import "LNWKWebViewController.h"
#import "LNWKObject.h"

//#import <CYLTabBarController+LNCustomBadge.h>

@interface LNViewController ()
@property (nonatomic,strong)LNWKObject *o1;
@end

@implementation LNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor cyanColor];
    
//    UIButton * badge = [UIButton buttonWithType:UIButtonTypeCustom];
//    [badge setTitle:@"显示消息" forState:UIControlStateNormal];
//    [badge addTarget:self action:@selector(addBdge) forControlEvents:UIControlEventTouchUpInside];
//    badge.frame = CGRectMake(100, 300, 200, 50);
//    badge.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:badge];
//    UIButton * hidBadge = [UIButton buttonWithType:UIButtonTypeCustom];
//    [hidBadge setTitle:@"隐藏消息" forState:UIControlStateNormal];
//    [hidBadge addTarget:self action:@selector(hidBadgeAction) forControlEvents:UIControlEventTouchUpInside];
//    hidBadge.frame = CGRectMake(100, 500, 200, 50);
//    hidBadge.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:hidBadge];
}
//- (void)addBdge
//{
//    if ([self.lntitle isEqualToString:@"vc1"]) {
//        [[UIApplication sharedApplication].cyl_tabBarController showBadgeAtIndex:0 andBadge:@"334"];
//    }else if ([self.lntitle isEqualToString:@"vc2"]) {
//        [[UIApplication sharedApplication].cyl_tabBarController showBadgeAtIndex:1 andBadge:@"88"];
//    }else if ([self.lntitle isEqualToString:@"vc3"]) {
//        [[UIApplication sharedApplication].cyl_tabBarController showBadgeAtIndex:2 andBadge:@"2555"];
//    }else if ([self.lntitle isEqualToString:@"vc4"]) {
//        [[UIApplication sharedApplication].cyl_tabBarController showBadgeAtIndex:3 andBadge:@"20"];
//    }else{
//        [[UIApplication sharedApplication].cyl_tabBarController showBadgeAtIndex:4 andBadge:@"11"];
//    }
//}
//- (void)hidBadgeAction
//{
//    if ([self.lntitle isEqualToString:@"vc1"]) {
//        [[UIApplication sharedApplication].cyl_tabBarController hiddenBadgeAtIndex:0];
//    }else if ([self.lntitle isEqualToString:@"vc2"]) {
//        [[UIApplication sharedApplication].cyl_tabBarController hiddenBadgeAtIndex:1];
//    }else if ([self.lntitle isEqualToString:@"vc3"]) {
//        [[UIApplication sharedApplication].cyl_tabBarController hiddenBadgeAtIndex:2];
//    }else if ([self.lntitle isEqualToString:@"vc4"]) {
//        [[UIApplication sharedApplication].cyl_tabBarController hiddenBadgeAtIndex:3];
//    }else{
//        [[UIApplication sharedApplication].cyl_tabBarController hiddenBadgeAtIndex:4];
//    }
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    LNWKObject *o1 = [[LNWKObject alloc] init];
    o1.methodName = @"JSMethod";
    o1.data = @"infoffffffooooo";
    o1.cbResponse = ^(id object) {
        NSLog(@"%@",object);
    };
    LNWKWebViewController *webvc = [[LNWKWebViewController alloc] initWithCancelWebViewLongPress:YES];
    webvc.requestURL = @"https://www.baidu.com";
    webvc.progressRect = CGRectMake(0,75,375,1);
    webvc.needProgress = YES;
    [webvc nativeCallJSMethod:o1];

    LNWKObject *o2 = [[LNWKObject alloc] init];
    o2.methodName = @"objcEchoToJs";
    o2.jsCallCbResponse = ^(id object, callback cb) {
        NSLog(@"%@",object);
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            cb(@"token tokentoken tokentoken tokentoken tokentoken tokentoken tokentoken tokentoken tokentoken tokentoken token");
        });
    };
    [webvc.jsCallNativeMethods addObject:o2];

    LNWKObject *o3 = [[LNWKObject alloc] init];
    o3.methodName = @"jsRcvResponseTest";
    o3.data = nil;
    o3.cbResponse = ^(id object) {
        NSLog(@"这里应该打印上面的信息1111.");
        NSLog(@"%@",object);
    };
    [webvc nativeCallJSMethod:o3];
    [self.navigationController pushViewController:webvc animated:YES];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
