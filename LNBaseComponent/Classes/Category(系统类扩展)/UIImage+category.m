//
//  UIImage+category.m
//  LNPSRefProject
//
//  Created by yakun yin on 2017/6/8.
//  Copyright © 2017年 yakun yin. All rights reserved.
//

#import "UIImage+category.h"

@implementation UIImage (category)

+ (UIImage*)resizeImage:(UIImage*)image withWidth:(CGFloat)width withHeight:(CGFloat)height
{
    CGSize newSize = CGSizeMake(width, height);
    CGFloat widthRatio = newSize.width/image.size.width;
    CGFloat heightRatio = newSize.height/image.size.height;
    
    if(widthRatio > heightRatio)
    {
        newSize=CGSizeMake(image.size.width*heightRatio,image.size.height*heightRatio);
    }
    else
    {
        newSize=CGSizeMake(image.size.width*widthRatio,image.size.height*widthRatio);
    }
    
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return  newImage;
}
+(UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (UIImage *)blurImage:(UIImage *)img{
    UIImage * image = img;/*..CoreImage中的模糊效果滤镜..*/
        //CIImage,相当于UIImage,作用为获取图片资源
    CIImage * ciImage = [[CIImage alloc]initWithImage:image];

        //CIFilter,高斯模糊滤镜
    CIFilter * blurFilter = [CIFilter filterWithName:@"CIGaussianBlur"];
        //将图片输入到滤镜中
    [blurFilter setValue:ciImage forKey:kCIInputImageKey];

        //用来查询滤镜可以设置的参数以及一些相关的信息
    NSLog(@"%@",[blurFilter attributes]);

        //设置模糊程度,默认为10,取值范围(0-100)

    [blurFilter setValue:@(10) forKey:@"inputRadius"];

        //将处理好的图片输出

    CIImage * outCiImage = [blurFilter valueForKey:kCIOutputImageKey];

    CIContext * context = [CIContext contextWithOptions:nil];
        //获取CGImage句柄,也就是从数据流中取出图片

    CGImageRef outCGImage = [context createCGImage:outCiImage fromRect:[outCiImage extent]];
        //最终获取到图片

    UIImage * blurImage = [UIImage imageWithCGImage:outCGImage];

        //释放CGImage句柄
    CGImageRelease(outCGImage);
    return blurImage;
}

@end
