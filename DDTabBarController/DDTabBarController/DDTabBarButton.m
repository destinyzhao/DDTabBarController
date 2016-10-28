//
//  DDTabBarButton.m
//  DDTabBarController
//
//  Created by Alex on 16/8/3.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "DDTabBarButton.h"

@implementation DDTabBarButton

//初始化并添加按钮到tabBar
- (instancetype)initWithTabBar:(UITabBar *)tabBar
                  forItemIndex:(NSUInteger)itemIndex
{
    
    if(self = [super init])
    {
        _tabBar = tabBar;
        _locationIndexInTabBar = itemIndex;
        
        self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin |
        UIViewAutoresizingFlexibleTopMargin;
        self.translatesAutoresizingMaskIntoConstraints = YES;
        
        [self installTheButton];
    }
    return self;
}

#pragma mark -
#pragma mark - 创建按钮
- (void)installTheButton
{
    if(self.tabBar.items.count > self.locationIndexInTabBar)
    {
        //位置和样式
        [[self.tabBar.items objectAtIndex:self.locationIndexInTabBar] setEnabled:NO];
        CGPoint pointToSuperview = [self buttonLocaitonForIndex:self.locationIndexInTabBar];
        CGRect myRect = [self buttonFrameForIndex:self.locationIndexInTabBar];
        //大小和偏移
        self.frame = myRect;
        self.center = CGPointMake(pointToSuperview.x, pointToSuperview.y);
        self.clipsToBounds = YES;
        [self.tabBar addSubview:self];
    }
}

#pragma mark -
#pragma mark - 按钮在tab上的中心位置
- (CGPoint)buttonLocaitonForIndex:(NSUInteger)index
{
    UITabBarItem *item = [self.tabBar.items objectAtIndex:index];
    UIView *view = [item valueForKey:@"view"];
    return view.center;
}

#pragma mark -
#pragma mark - 按钮在tab上的位置
- (CGRect)buttonFrameForIndex:(NSUInteger)index
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    UITabBarItem *item = [self.tabBar.items objectAtIndex:index];
    UIView *view = [item valueForKey:@"view"];
    view.frame = CGRectMake((bounds.size.width-view.frame.size.width)/2, 0, view.frame.size.width, view.frame.size.height);
    return view.frame;
}

#pragma mark -
#pragma mark - 根据图片自动调整大小
- (void)setImage:(UIImage *)image forState:(UIControlState)state
{
    [super setImage:image forState:state];
    
    if(state == UIControlStateNormal)
    {
        CGPoint pointToSuperview = [self buttonLocaitonForIndex:self.locationIndexInTabBar];
        self.frame = (CGRect){0, 0, image.size.width, image.size.height};
        self.center = CGPointMake(pointToSuperview.x, pointToSuperview.y - self.heightOffset);
    }
}

#pragma mark -
#pragma mark - 设置按钮上下偏移位置
- (void)setHeightOffset:(CGFloat)heightOffset
{
    _heightOffset = heightOffset;
    
    CGPoint pointToSuperview = [self buttonLocaitonForIndex:self.locationIndexInTabBar];
    self.center = CGPointMake(pointToSuperview.x, pointToSuperview.y - heightOffset);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
