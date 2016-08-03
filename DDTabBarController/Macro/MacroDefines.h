//
//  MacroDefines.h
//  DDTabBarController
//
//  Created by Alex on 16/8/3.
//  Copyright © 2016年 Alex. All rights reserved.
//

#ifndef MacroDefines_h
#define MacroDefines_h

// 获取AppDelegate
#define appDelegate ((AppDelegate *)[UIApplication sharedApplication].delegate)
// 获取Window
#define WINDOW (appDelegate.window)

/// 获取StoryBoard
#define storyboardWithName(sbName) [UIStoryboard storyboardWithName:sbName bundle:bundle]

#define viewControllerInStoryBoard(vcID, sbName) [[UIStoryboard storyboardWithName:sbName bundle:nil] instantiateViewControllerWithIdentifier:vcID]



#endif /* MacroDefines_h */
