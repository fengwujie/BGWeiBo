//
//  AppDelegate.m
//  BGWeiBo
//
//  Created by fengwujie on 15/9/11.
//  Copyright (c) 2015年 BG. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1.创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    // 2.设置根控制器
    UITabBarController *tabbarVc = [[UITabBarController alloc] init];
    self.window.rootViewController = tabbarVc;
    
    
    //3. 设置子控制器
    UIViewController *vc1 = [[UIViewController alloc] init];
    vc1.view.backgroundColor = BGRandomColor;
    vc1.tabBarItem.title = @"首页";
    vc1.tabBarItem.image = [UIImage imageNamed:@"tabbar_home"];
    // 图片按原始样子显示，不自动渲染成其他颜色（如tabbarItem会默认变蓝色）
    UIImage *homeSelectedImage = [[UIImage imageNamed:@"tabbar_home_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc1.tabBarItem.selectedImage = homeSelectedImage;
    
    //y设置文字属性
    NSMutableDictionary *attriDict = [NSMutableDictionary dictionary];
    attriDict[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [vc1.tabBarItem setTitleTextAttributes:attriDict forState:UIControlStateSelected];
    
    UIViewController *vc2 = [[UIViewController alloc] init];
    vc2.view.backgroundColor = BGRandomColor;
    vc2.tabBarItem.title = @"消息";
    vc2.tabBarItem.image = [UIImage imageNamed:@"tabbar_message_center"];
    // 图片按原始内容显示，不做处理（如tabbarItem会默认变蓝色）
    UIImage *messageSelectedImage = [[UIImage imageNamed:@"tabbar_message_center_selected"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    vc2.tabBarItem.selectedImage = messageSelectedImage;
    
    UIViewController *vc3 = [[UIViewController alloc] init];
    vc3.view.backgroundColor = BGRandomColor;
    
    UIViewController *vc4 = [[UIViewController alloc] init];
    vc4.view.backgroundColor = BGRandomColor;
    
    UIViewController *vc5 = [[UIViewController alloc] init];
    vc5.view.backgroundColor = BGRandomColor;
    
    tabbarVc.viewControllers = @[vc1, vc2, vc3, vc4, vc5];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
