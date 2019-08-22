//
//  AttributeManager.h
//  LNUniversalApplication
//
//  Created by 尹亚坤 on 2019/8/2.
//  Copyright © 2019 lenovo. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface AttributeManager : NSObject
@property (nonatomic,strong)NSMutableAttributedString *result;

- (instancetype)initWithString:(NSString *)str;

/**
 设置行高
 */
- (AttributeManager *(^)(double height))lineSpaceHeight;

/**
 设置字间距
 */
- (AttributeManager *(^)(double height))wordSpaceWidth;

/**
 设置textalignment
 */
- (AttributeManager *(^)(NSTextAlignment textalignment))alignment;

/**
 设置某个范围内的字体的颜色
 */
- (AttributeManager *(^)(NSRange range,UIColor *color))partTextColorful;

@end

NS_ASSUME_NONNULL_END
