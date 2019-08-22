//
//  UIColor+HEX.h
//  LNPSRefProject
//
//  Created by yakun yin on 2017/6/8.
//  Copyright © 2017年 yakun yin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (HEX)

/**
 根据十六进制数 获取Color

 @param HEXColorStr 十六进制  exp: "#25b6ed"
 @param alphaValue 通名都
 @return color
 */
+ (UIColor *)colorWithHEX: (NSString *)HEXColorStr alpha:(CGFloat)alphaValue;

/**
 根据十六进制数 获取Color
 
 @param HEXColorStr 十六进制  exp: "#25b6ed",alpha: 1.f
 @return color
 */
+ (UIColor *)colorWithHEX: (NSString *)HEXColorStr;
@end
