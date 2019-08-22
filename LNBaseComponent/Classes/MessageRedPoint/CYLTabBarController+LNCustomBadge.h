//
//  CYLTabBarController+LNCustomBadge.h
//  Portal
//
//  Created by yakun yin on 2017/10/13.
//  Copyright © 2017年 Lenovo. All rights reserved.
//

#import <CYLTabBarController/CYLTabBarController.h>

@interface CYLTabBarController (LNCustomBadge)

- (void)showBadgeAtIndex:(NSInteger)index andBadge:(NSString *)str;

- (void)hiddenBadgeAtIndex:(NSInteger)index;

@end
