//
//  UIViewController+addRightBarButtonItems.h
//  乐聊Cochat
//
//  Created by yinyakun on 16/6/7.
//  Copyright © 2016年 www.samsundot.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (addRightBarButtonItems)

/**
 添加返回按钮
 */
- (void)addBackBtn;
/**
 *  添加navigationBar 的rightBarButtonItem
 *
 *  @param images 图片
 */
- (void)addRightButtonItemWithImages:(NSArray<UIImage *> *)images;
- (void)addRightBtnWithTitle:(NSString *)title andTextColor:(UIColor *)titileColor;
/**
 *添加navigationBar 的leftBarButtonItem
 *
 *  @param images 图片
 */
- (void)addLeftButtonItemWithImages:(NSArray<UIImage *> *)images;
/**
 *  设置 titleView 的图片
 *
 *  @param image 图片
 */
- (void)titleViewWithImages:(UIImage *)image;

/**
 *  此方法需要重写
 *
 */
- (void)clickRightItems:(UIButton *)sender;

/**
 *  此方法需要重写
 *
 */
- (void)clickLeftItems:(UIButton *)sender;

- (void) addRightBtnWithTitle:(NSString *)title;
/**
 *  设置button 的选中的图片
 *
 *  @param image     选中的图片
 *  @param buttonTag button Tag
 */
-(void)setSelectedImage:(UIImage *)image withButtonTag:(NSInteger)buttonTag;

/**
 *  修改button 的选中的图片
 *
 *  @param image     选中的图片
 *  @param buttonTag button Tag
 */
-(void)changeImage:(UIImage *)image WithStatus:(UIControlState)state withButtonTag:(NSInteger)buttonTag;
/**
 *  设置button 的选中状态
 *
 *  @param isSelect     isSelect  (yes: 选中, no : 非选中)
 *  @param buttonTag button Tag
 */
-(void)setSelected:(BOOL)isSelect withButtonTag:(NSInteger)buttonTag;

/**
 *  取button
 *
 *  @param tag tag
 *
 *  @return button
 */
- (UIButton *)buttonWithTag:(NSInteger)tag;

- (void)showGuidePointAtIndex:(NSInteger)tag;


- (void)hiddenGuidePointAtIndex:(NSInteger)tag;

/**
 *  删除右边按钮
 */
- (void)removeRightItem;

/**
 *  删除左边按钮
 */
- (void)removeLeftItem;

- (void)addRightBtnWithTitle:(NSString *)title andTextColor:(UIColor *)titileColor andTextFont:(UIFont *)font;

@end
