//
//  DDTabBarController.m
//  DDTabBarController
//
//  Created by Alex on 16/8/3.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "DDTabBarController.h"
#import "DDTabBarItem.h"
#import "DDTabBarButton.h"

@interface DDTabBarController ()

@end

@implementation DDTabBarController

+(instancetype)sharedTabBarController
{
    static DDTabBarController *_tabBarController;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (_tabBarController == nil) {
            _tabBarController = [[DDTabBarController alloc]init];
        }
    });
    return _tabBarController;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupViewController];
    
    [self setBadgeWithIndex:@"new" index:0];
    [self setBadgeWithIndex:@"8" index:1];
    
    //设定Tabbar的颜色
    [[UITabBar appearance] setBackgroundColor:[UIColor blackColor]];
}

- (void)setupViewController
{
    NSArray *storyBoardArray = @[@"StoryBoard1",@"StoryBoard2",@"StoryBoard3",@"StoryBoard4",@"StoryBoard5"];
    NSMutableArray *viewControllerArray = [NSMutableArray array];
    for (NSString *sbName in storyBoardArray) {
        UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:sbName bundle:nil];
        UINavigationController *viewController = (UINavigationController *)[storyBoard instantiateInitialViewController];

        [viewControllerArray addObject:viewController];
    }
    
    self.viewControllers = viewControllerArray;
    
    [self setupTabBarItem:viewControllerArray];
    
    // 设置默认选中的 Tabbar Item
    self.selectedIndex = 0;
}

- (void)setupTabBarItem:(NSMutableArray *)viewControllerArray
{
    NSArray *titleArray = @[@"Item1",@"Item2",@"",@"Item4",@"Item5"];
    NSArray *normalImgArray = @[@"tab_bar_item1_n",@"tab_bar_item2_n",@"",@"tab_bar_item4_n",@"tab_bar_item5_n"];
    NSArray *selectedImgArray = @[@"tab_bar_item1_s",@"tab_bar_item2_s",@"",@"tab_bar_item4_s",@"tab_bar_item5_s"];
    
    for (NSInteger i = 0; i < viewControllerArray.count; i++) {
        
        if (i == 2) {
            continue;
        }
        UINavigationController *navi = viewControllerArray[i];
        navi.tabBarItem = [DDTabBarItem itemWithTitle:titleArray[i] normalImg:normalImgArray[i] selectImg:selectedImgArray[i]];
    }
    
    [self setupCenterButton];

}

- (void)setupCenterButton
{
     DDTabBarButton *centerButton = [[DDTabBarButton alloc] initWithTabBar:self.tabBar forItemIndex:2];
    [centerButton setHeightOffset:5];
    [centerButton setImage:[UIImage imageNamed:@"tab_bar_item3_n"]
                                        forState:UIControlStateNormal];
    [centerButton setImage:[UIImage imageNamed:@"tab_bar_item3_s"]
                                        forState:UIControlStateHighlighted];
    [centerButton addTarget:self
                     action:@selector(centerButtonPressed:)
                                 forControlEvents:UIControlEventTouchUpInside];
}

- (void)centerButtonPressed:(UIButton *)sender
{
    self.selectedIndex = 2;
}

- (void)setBadgeWithIndex:(NSString *)badge index:(NSInteger)index
{
    UINavigationController *navi = self.viewControllers[index];
    navi.tabBarItem.badgeValue = badge;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
