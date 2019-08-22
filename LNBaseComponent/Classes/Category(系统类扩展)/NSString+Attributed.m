//
//  NSString+Attributed.m
//  LNUniversalApplication
//
//  Created by 尹亚坤 on 2019/8/2.
//  Copyright © 2019 lenovo. All rights reserved.
//

#import "NSString+Attributed.h"

@implementation NSString (Attributed)
- (NSMutableAttributedString *)ln_makeAttribute:(void(^)(AttributeManager *make))block{
    AttributeManager *manager = [[AttributeManager alloc] initWithString:self];
    block(manager);
    return manager.result;
}
@end
