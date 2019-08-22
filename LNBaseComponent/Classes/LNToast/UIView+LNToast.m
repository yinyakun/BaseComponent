//
//  UIView+LNToast.m
//  AFNetworking
//
//  Created by 尹亚坤 on 2019/2/26.
//

#import "UIView+LNToast.h"
#import <Toast/UIView+Toast.h>

@implementation UIView (LNToast)
- (void)lnMakeToast:(NSString *)message{
    CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];
    style.messageFont = [UIFont systemFontOfSize:14];//[UIFont fontWithName:@"Zapfino" size:14.0];
    style.messageColor = [UIColor redColor];
    style.messageAlignment = NSTextAlignmentCenter;
    style.backgroundColor = [UIColor greenColor];
    style.cornerRadius = 20.f;
    style.horizontalPadding = 20;

    [self makeToast:message
           duration:3.0
           position:CSToastPositionBottom
              style:style];
}

- (void)lnMakeToast:(NSString *)message andTextColor:(UIColor *)color{
    CSToastStyle *style = [[CSToastStyle alloc] initWithDefaultStyle];
    style.messageFont = [UIFont systemFontOfSize:14];//[UIFont fontWithName:@"Zapfino" size:14.0];
    style.messageColor = color;
    style.messageAlignment = NSTextAlignmentCenter;
    style.backgroundColor = [UIColor greenColor];
    style.cornerRadius = 20.f;
    style.horizontalPadding = 20;

    [self makeToast:message
           duration:3.0
           position:CSToastPositionBottom
              style:style];
}

@end
