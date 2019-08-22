//
//  LNAppDelegate.m
//  LNBaseComponent
//
//  Created by yinyakun on 12/07/2018.
//  Copyright (c) 2018 yinyakun. All rights reserved.
//

#import "LNAppDelegate.h"
#import "PCCircleViewConst.h"
#import "GestureVerifyViewController.h"
#import "GestureViewController.h"

#import <LNCalculateAuthKey.h>

#import "UIView+LNToast.h"
#import "LNViewController.h"
//#import <CYLTabBarController.h>

@implementation LNAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    NSString *authkey = [[LNCalculateAuthKey shareHelper] calculateAuthKeyWithRSAPublicKey:@"0" token:@"1" packageID:@"2" andRouteKey:@"3" appKey:@""];
//    NSLog(@"%@",authkey);
//    NSString *gesture = [PCCircleViewConst getGestureWithKey:@"yinyk1"];
//    if ([gesture length] ) {
//        GestureVerifyViewController *gestureVerifyVc = [[GestureVerifyViewController alloc] init];
//        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:gestureVerifyVc];
//        gestureVerifyVc.checkedResult = ^(BOOL result) {
//            if (result == YES){
//                NSLog(@"%@",@"验证成功");
//            }
//        };
//        self.window.rootViewController = navVC;
//    }else{
//        GestureViewController *gestureVc = [[GestureViewController alloc] init];
//        gestureVc.type = GestureViewControllerTypeSetting;
//        UINavigationController *navVC = [[UINavigationController alloc] initWithRootViewController:gestureVc];
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [navVC.view lnMakeToast:@"hello world"];
//        });
//        self.window.rootViewController = navVC;
//    }

    LNViewController *vc1 = [[LNViewController alloc] init];
    vc1.lntitle = @"vc1";
    LNViewController *vc2 = [[LNViewController alloc] init];
    vc2.lntitle = @"vc2";
    LNViewController *vc3 = [[LNViewController alloc] init];
    vc3.lntitle = @"vc3";
    LNViewController *vc4 = [[LNViewController alloc] init];
    vc4.lntitle = @"vc4";
    LNViewController *vc5 = [[LNViewController alloc] init];
    vc5.lntitle = @"vc5";
//    NSDictionary *tabBarItem1Attribute = @{
//                                           CYLTabBarItemTitle : @"123",
//                                           CYLTabBarItemImage :@"tabbar_home_selected",
//                                           CYLTabBarItemSelectedImage : @"tabbar_home_selected"
//                                           };
//    CYLTabBarController * tabbar = [[CYLTabBarController alloc]initWithViewControllers:@[vc1,vc2,vc3,vc4,vc5] tabBarItemsAttributes:@[tabBarItem1Attribute,tabBarItem1Attribute,tabBarItem1Attribute,tabBarItem1Attribute,tabBarItem1Attribute]];
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:vc1];

    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
