//
//  UIView+LNToast.h
//  AFNetworking
//
//  Created by 尹亚坤 on 2019/2/26.
//

#import <UIKit/UIKit.h>

#import <Toast/UIView+Toast.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (LNToast)
- (void)lnMakeToast:(NSString *)message;
- (void)lnMakeToast:(NSString *)message andTextColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
