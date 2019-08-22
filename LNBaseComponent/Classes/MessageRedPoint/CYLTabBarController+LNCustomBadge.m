//
//  CYLTabBarController+LNCustomBadge.m
//  Portal
//
//  Created by yakun yin on 2017/10/13.
//  Copyright © 2017年 Lenovo. All rights reserved.
//

#import "CYLTabBarController+LNCustomBadge.h"

#define badgeTag0 101010
#define badgeTag1 101011
#define badgeTag2 101012
#define badgeTag3 101013

#define badgeWidth 18

@implementation CYLTabBarController (LNCustomBadge)

- (void)showBadgeAtIndex:(NSInteger)index andBadge:(NSString *)str{

    UITabBar *tabbar = self.tabBar;
    UILabel *label   = [tabbar viewWithTag:badgeTag0 + index];
    if (!label) {
        [self addBadgeAtIndex:index Number:str];
        UILabel *labeltemp   = [tabbar viewWithTag:badgeTag0 + index];
        label = labeltemp;
    }
    label.text = str;
    CGSize size = CGSizeMake(badgeWidth * 2,badgeWidth); //设置一个行高上限
    NSDictionary *attribute = @{NSFontAttributeName: label.font};
    CGSize labelsize = [str boundingRectWithSize:size options:NSStringDrawingUsesDeviceMetrics attributes:attribute context:nil].size;
    CGFloat realSizeWidth   = labelsize.width > badgeWidth ? labelsize.width + 5: badgeWidth;
    if (realSizeWidth > badgeWidth * 2) {
        str = @"...";
        realSizeWidth = badgeWidth;
    }
    CGFloat realSizeHeight  = badgeWidth;
    label.frame = CGRectMake(label.frame.origin.x, label.frame.origin.y, realSizeWidth,realSizeHeight);
    label.text = str;
}

- (void)hiddenBadgeAtIndex:(NSInteger)index{
    UITabBar *tabbar = self.tabBar;
    UILabel *label   = [tabbar viewWithTag:badgeTag0 + index];
    if (!label) {
        return;
    }else{
        [label removeFromSuperview];
    }
}

- (void)addBadgeAtIndex:(NSInteger)index Number:(NSString *)number{
    UITabBar *tabbar = self.tabBar;
    UILabel *badge=[[UILabel alloc]init];
    badge.text = number;
    badge.textAlignment=NSTextAlignmentNatural;
    badge.textAlignment=NSTextAlignmentCenter;
// 计算每个iteam的大小
    CGFloat iteamW = [UIScreen mainScreen].bounds.size.width / self.tabBarItemsAttributes.count;
    //计算每个小红点的X坐标，如果1/4iteam大小，大于小红点的宽，则取1/4iteam大小，反之则取小红点的宽
    CGFloat x =  iteamW * index + ((iteamW/4) > badgeWidth?(iteamW/4*3):(iteamW/2+badgeWidth));
    badge.frame=CGRectMake(x, 3, badgeWidth, badgeWidth);
    badge.layer.cornerRadius=badgeWidth / 2.f;
    badge.font = [UIFont systemFontOfSize:11];
    badge.layer.masksToBounds = YES;
    badge.textColor=[UIColor whiteColor];
    badge.backgroundColor=[UIColor redColor];
    badge.tag = badgeTag0 + index;
    [tabbar addSubview:badge];
}

@end
