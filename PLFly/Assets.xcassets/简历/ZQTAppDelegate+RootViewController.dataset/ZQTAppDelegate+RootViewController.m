//
//  ZQTAppDelegate+RootViewController.m
//  ZhiQianTong
//
//  Created by zpz on 2017/12/12.
//  Copyright © 2017年 ZhiQianTong. All rights reserved.
//

#import "ZQTAppDelegate+RootViewController.h"
#import "ZQTTabBarControllerConfig.h"
#import "UITabBar+ZQTTabBar.h"
@implementation ZQTAppDelegate (RootViewController)

- (void)setWindowRootViewController
{
    ZQTTabBarControllerConfig *tabBarControllerConfig = [[ZQTTabBarControllerConfig alloc] init];
    self.window.rootViewController = tabBarControllerConfig.tabBarController;
}
@end
