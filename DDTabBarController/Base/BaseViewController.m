//
//  BaseViewController.m
//  DDTabBarController
//
//  Created by Alex on 16/8/3.
//  Copyright © 2016年 Alex. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    if (self.navigationController.viewControllers.count > 1) {
        self.tabBarController.tabBar.hidden = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initCustomNavigationItem];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  自定义返回按钮
 */
- (void)initCustomNavigationItem
{
    if (!self.navigationItem.leftBarButtonItem) {
        UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"navi_back"] style:UIBarButtonItemStylePlain target:self action:@selector(onGoBack:)];
        leftItem.tintColor = [UIColor whiteColor];
        self.navigationItem.leftBarButtonItem = leftItem;
    }
    self.automaticallyAdjustsScrollViewInsets = NO;
}

/**
 *  返回按钮点击事件
 *
 *  @param sender
 */
- (void)onGoBack:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
