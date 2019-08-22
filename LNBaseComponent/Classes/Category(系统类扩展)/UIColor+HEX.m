//
//  UIColor+HEX.m
//  LNPSRefProject
//
//  Created by yakun yin on 2017/6/8.
//  Copyright © 2017年 yakun yin. All rights reserved.
//

#import "UIColor+HEX.h"

@implementation UIColor (HEX)
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
    return [UIColor colorWithHEX:HEXColorStr alpha:1.f];
}
@end
