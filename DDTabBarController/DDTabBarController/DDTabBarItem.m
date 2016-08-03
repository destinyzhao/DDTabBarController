//
//  DDTabBarItem.m
//  DDTabBarController
//
//  Created by Alex on 16/8/3.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "DDTabBarItem.h"

@implementation DDTabBarItem

+ (UITabBarItem *)itemWithTitle:(NSString *)title normalImg:(NSString *)normalImg selectImg:(NSString *)selectImg
{
    // 默认图片
    UIImage * normalImage = [[UIImage imageNamed:normalImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 选中图片
    UIImage * selectImage = [[UIImage imageNamed:selectImg] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    UITabBarItem *tabItem = [[UITabBarItem alloc] initWithTitle:title
                                            image:normalImage
                                    selectedImage:selectImage];
    //设置偏移
    //tabItem.imageInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    //tabItem.titlePositionAdjustment = (UIOffset){0, -1.f};
    
    // 默认颜色
    [tabItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor grayColor]} forState:UIControlStateNormal];
    // 选中颜色
    [tabItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor greenColor]}
                           forState:UIControlStateSelected];
    
    return tabItem;
}


@end
