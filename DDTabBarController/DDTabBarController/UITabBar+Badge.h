//
//  UITabBar+Badge.h
//  DDTabBarController
//
//  Created by Alex on 2016/12/23.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITabBar (Badge)

- (void)showBadgeOnItemIndex:(int)index;   //显示小红点

- (void)hideBadgeOnItemIndex:(int)index; //隐藏小红点

@end
