//
//  NSString+Attributed.h
//  LNUniversalApplication
//
//  Created by 尹亚坤 on 2019/8/2.
//  Copyright © 2019 lenovo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AttributeManager.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSString (Attributed)

/**
 属性字符串添加样式

 @param block 属性样式回调
 @return 调整完后的样式
 */
- (NSMutableAttributedString *)ln_makeAttribute:(void(^)(AttributeManager *make))block;

@end

NS_ASSUME_NONNULL_END
