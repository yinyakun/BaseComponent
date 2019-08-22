 //
//  UIViewController+addRightBarButtonItems.m
//  乐聊Cochat
//
//  Created by yinyakun on 16/6/7.
//  Copyright © 2016年 www.samsundot.com. All rights reserved.
//

#import "UIViewController+addRightBarButtonItems.h"

#define badgeWidth 10
#define kScreenWidth_cty     [UIScreen mainScreen].bounds.size.width

@implementation UIViewController (addRightBarButtonItems)

- (void)addRightButtonItemWithImages:(NSArray<UIImage *> *)images
{
    [self addRightBarButtonItems1:images];
}

- (void)addRightBarButtonItems1:(NSArray<UIImage *> *)images
{
    NSMutableArray *itemArray = [[NSMutableArray alloc] init];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -15;
    [itemArray addObject:negativeSpacer];
    for (int i = 0; i < images.count; i++) {
        UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        searchBtn.frame = CGRectMake(0, 0, 40, 44);
        searchBtn.tag = i+1;
        [searchBtn setImage:images[i]  forState:UIControlStateNormal];
        [searchBtn addTarget:self action:@selector(clickRightItems:) forControlEvents:UIControlEventTouchUpInside];
//        searchBtn.translatesAutoresizingMaskIntoConstraints = NO;
        if (@available(iOS 11.0, *)) {
            searchBtn.imageEdgeInsets = UIEdgeInsetsMake(5, 25, 5, -5);
        }else{
            
        }
        UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
        [itemArray addObject:searchItem];
    }
    self.navigationItem.rightBarButtonItems = itemArray;
}
- (void)addRightBtnWithTitle:(NSString *)title{
    UIButton *searchBtn = [self createRightBtnWithTitle:title andFont:[UIFont systemFontOfSize:15]];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    self.navigationItem.rightBarButtonItem = searchItem;
}
- (void)addRightBtnWithTitle:(NSString *)title andTextColor:(UIColor *)titileColor
{
    UIButton *searchBtn = [self createRightBtnWithTitle:title andFont:[UIFont systemFontOfSize:15]];
    [searchBtn setTitleColor:titileColor forState:UIControlStateNormal];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    self.navigationItem.rightBarButtonItem = searchItem;

}

- (void)addRightBtnWithTitle:(NSString *)title andTextColor:(UIColor *)titileColor andTextFont:(UIFont *)font
{
    UIButton *searchBtn = [self createRightBtnWithTitle:title andFont:font];
    [searchBtn setTitleColor:titileColor forState:UIControlStateNormal];
    UIBarButtonItem *searchItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -5;
    self.navigationItem.rightBarButtonItems = @[negativeSpacer,searchItem];
}

- (UIButton *)createRightBtnWithTitle:(NSString *)title andFont:(UIFont *)font
{
    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    searchBtn.frame = CGRectMake(0, 0, 40, 40);
    searchBtn.titleLabel.font = font;
    [searchBtn setTitle:title  forState:UIControlStateNormal];
    searchBtn.titleLabel.adjustsFontSizeToFitWidth = YES;
    [searchBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [searchBtn addTarget:self action:@selector(clickRightItems:) forControlEvents:UIControlEventTouchUpInside];
    searchBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, -5);
    return searchBtn;

}
/**
 *添加navigationBar 的leftBarButtonItem
 *
 *  @param images 图片
 */
- (void)addLeftButtonItemWithImages:(NSArray<UIImage *> *)images
{
    NSMutableArray *itemsArray = [NSMutableArray array];
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    negativeSpacer.width = -15;
    [itemsArray addObject:negativeSpacer];
    for (int i = 0; i < images.count; i++) {
        UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        searchBtn.frame = CGRectMake(0, 0, 40, 44);
        searchBtn.tag = i+100;
        [searchBtn setImage:images[i]  forState:UIControlStateNormal];
        [searchBtn addTarget:self action:@selector(clickLeftItems:) forControlEvents:UIControlEventTouchUpInside];
//        searchBtn.translatesAutoresizingMaskIntoConstraints = NO;
        if (@available(iOS 11.0, *)) {
            searchBtn.imageEdgeInsets = UIEdgeInsetsMake(12, -10, 12, 30);
        }else{
            
        }
        UIBarButtonItem *tempItem = [[UIBarButtonItem alloc] initWithCustomView:searchBtn];
        [itemsArray addObject:tempItem];
    }
    self.navigationItem.leftBarButtonItems = itemsArray;
    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;      //解决添加了 leftBarButtonItem 后手势返回不能用的问题.
}



/**
 *  设置 titleView 的图片
 *
 *  @param image 图片
 */
- (void)titleViewWithImages:(UIImage *)image
{
    UIView *tempView = [[UIView alloc] initWithFrame:CGRectMake(0, 26, kScreenWidth_cty - 100, 35)];
    UIImageView *tempImageView = [[UIImageView alloc] initWithFrame:CGRectMake(15,0, tempView.frame.size.width - 20, 35)];
    tempImageView.image = image;
    tempImageView.contentMode = UIViewContentModeScaleAspectFit;
    [tempView addSubview:tempImageView];
    self.navigationItem.titleView = tempView;
    if (self.navigationItem.rightBarButtonItems.count == 3) {
        tempImageView.frame = CGRectMake(20, 0,  tempView.frame.size.width - 20, 35);
    }
}

- (void)clickRightItems:(UIButton *)sender
{
    sender.selected = !sender.selected;
}

- (void)clickLeftItems:(UIButton *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

/**
 *  设置button 的选中的图片
 *
 *  @param image     选中的图片
 *  @param buttonTag button Tag
 */
-(void)setSelectedImage:(UIImage *)image withButtonTag:(NSInteger)buttonTag
{
    NSArray *arrayItems = self.navigationItem.rightBarButtonItems;
    UIBarButtonItem *item = arrayItems[buttonTag + 1];
    UIButton *customV = (UIButton *)item.customView;
    
    [customV setImage:image forState:UIControlStateSelected];
//    customV.selected = YES;

}
/**
 *  修改button 的选中的图片
 *
 *  @param image     选中的图片
 *  @param buttonTag button Tag
 */
-(void)changeImage:(UIImage *)image WithStatus:(UIControlState)state withButtonTag:(NSInteger)buttonTag{
    NSArray *arrayItems = self.navigationItem.rightBarButtonItems;
    UIBarButtonItem *item = arrayItems[buttonTag + 1];
    UIButton *customV = (UIButton *)item.customView;
    [customV setImage:image forState:state];
    customV.selected = !customV.selected;
}

/**
 *  设置button 的选中的图片
 *
 *  @param isSelect     isSelect  (yes: 选中, no : 非选中)
 *  @param buttonTag button Tag
 */
-(void)setSelected:(BOOL)isSelect withButtonTag:(NSInteger)buttonTag
{
    NSArray *arrayItems = self.navigationItem.rightBarButtonItems;
    UIBarButtonItem *item = arrayItems[buttonTag + 1];
    UIButton *customV = (UIButton *)item.customView;
    customV.selected = isSelect;

}

/**
 *  取button
 *
 *  @param tag tag
 *
 *  @return button
 */
- (UIButton *)buttonWithTag:(NSInteger)tag
{
    NSArray *arrayItems = self.navigationItem.rightBarButtonItems;
    UIBarButtonItem *item = arrayItems[tag + 1];
    UIButton *customV = (UIButton *)item.customView;
    return customV;
}
/**
 *  删除右边按钮
 */
- (void)removeRightItem
{
    self.navigationItem.rightBarButtonItem = nil;
    self.navigationItem.rightBarButtonItems = nil;
}

/**
 *  删除左边按钮
 */
- (void)removeLeftItem
{
    self.navigationItem.leftBarButtonItem = nil;
    self.navigationItem.leftBarButtonItems = nil;
}

- (void)showGuidePointAtIndex:(NSInteger)tag
{
    UIButton *tempButton = [self buttonWithTag:tag];
    if ([tempButton viewWithTag:11001]) {
        
    }
    else{
        UIView *redItem = [[UIView alloc] initWithFrame:CGRectMake(tempButton.frame.size.width - badgeWidth, badgeWidth - 5., badgeWidth, badgeWidth)];
        redItem.backgroundColor = [UIColor redColor];
        redItem.tag = 11001;
        redItem.layer.cornerRadius = badgeWidth / 2.f;
        redItem.layer.masksToBounds = YES;
        [tempButton addSubview:redItem];
    }
    
}

- (void)addBackBtn{
//    if ([self.navigationController.navigationBar viewWithTag:9875]) {
//        return;
//    }
//    UIView *UIButtonBackButtonItem = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
//    UIButtonBackButtonItem.tag = 9875;
//    UITapGestureRecognizer *tapG = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapBackGesture:)];
//    tapG.numberOfTapsRequired =1;
//    tapG.numberOfTouchesRequired = 1;
//    UIButtonBackButtonItem.backgroundColor = [UIColor clearColor];
//    [self.navigationItem setHidesBackButton:YES];
//    [self.navigationController.navigationItem setHidesBackButton:YES];
//    [self.navigationController.navigationBar.backItem setHidesBackButton:YES];
//
//    [self.navigationController.navigationBar addSubview:UIButtonBackButtonItem];
//
//    UIButton *searchBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    searchBtn.frame = CGRectMake(0, 0, 40, 44);
//    [searchBtn setImage:[UIImage imageNamed:@"icon-top03"] forState:UIControlStateNormal];
//    [searchBtn addTarget:self action:@selector(clickBack:) forControlEvents:UIControlEventTouchUpInside];
//    [UIButtonBackButtonItem addSubview:searchBtn];
//    self.navigationController.interactivePopGestureRecognizer.delegate = (id)self;      //解决添加了 leftBarButtonItem 后手势返回不能用的问题.
    
    [self addLeftButtonItemWithImages:@[[UIImage imageNamed:@"icon-top03"]]];
}
- (void)hiddenGuidePointAtIndex:(NSInteger)tag
{
    UIButton *tempButton = [self buttonWithTag:tag];
    [[tempButton viewWithTag:11001] removeFromSuperview];
}

//- (void)clickBack:(UIButton *)seder{
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//- (void)tapBackGesture:(UITapGestureRecognizer *)gesture{
//    [self.navigationController popViewControllerAnimated:YES];
//}
@end
