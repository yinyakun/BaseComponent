//
//  UIImage+category.h
//  LNPSRefProject
//
//  Created by yakun yin on 2017/6/8.
//  Copyright © 2017年 yakun yin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (category)

/**
 重置图片大小

 @param image 原始图片
 @param width 要修改的宽
 @param height 要修改的高
 @return 修改后图片
 */
+ (UIImage*)resizeImage:(UIImage*)image withWidth:(CGFloat)width withHeight:(CGFloat)height;

/**
 根据颜色值生成图片

 @param color 颜色
 @return UIImage
 */
+(UIImage *)imageWithColor:(UIColor *)color;

/**
 给图片添加模糊效果

 @param img 原始图片
 @return 模糊后的图片
 */
- (UIImage *)blurImage:(UIImage *)img;
@end
