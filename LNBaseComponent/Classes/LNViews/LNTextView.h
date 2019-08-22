//
//  LNTextView.h
//  LNUniversalApplication
//
//  Created by 尹亚坤 on 2019/7/11.
//  Copyright © 2019 lenovo. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LNTextView : UITextView
/** 占位文字 */
@property (nonatomic, copy) NSString *placeholder;
/** 占位文字颜色 */
@property (nonatomic, strong) UIColor *placeholderColor;
@end

NS_ASSUME_NONNULL_END
