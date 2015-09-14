//
//  AppDelegate.m
//  BGWeiBo
//
//  Created by fengwujie on 15/9/11.
//  Copyright (c) 2015年 BG. All rights reserved.
//

#import "AppDelegate.h"
#import "BGHomeViewController.h"
#import "BGMessageCenterViewController.h"
#import "BGDiscoverViewController.h"
#import "BGProfileViewController.h"

@interface AppDelegate ()

@property (nonatomic, strong) UITabBarController *tabbarVc;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 1.创建窗口
    self.window = [[UIWindow alloc] init];
    self.window.frame = [UIScreen mainScreen].bounds;
    
    // 2.设置根控制器
    UITabBarController *tabbarVc = [[UITabBarController alloc] init];
    self.window.rootViewController = tabbarVc;
    self.tabbarVc = tabbarVc;
    
    //3. 设置子控制器
    BGHomeViewController *home = [[BGHomeViewController alloc] init];
    [self addChildVc: home title:@"首页" image:@"tabbar_home" selectImage:@"tabbar_home_selected"];
    BGMessageCenterViewController *messageCenter = [[BGMessageCenterViewController alloc] init];
    [self addChildVc:messageCenter title:@"消息" image:@"tabbar_message_center" selectImage:@"tabbar_message_center_selected"];
    BGDiscoverViewController *discover = [[BGDiscoverViewController alloc] init];
    [self addChildVc:discover title:@"发现" image:@"tabbar_discover" selectImage:@"tabbar_discover_selected"];
    BGProfileViewController *profile = [[BGProfileViewController alloc] init];
    [self addChildVc: profile title:@"我" image:@"tabbar_profile" selectImage:@"tabbar_profile_selected"];
    
    [self.window makeKeyAndVisible];
    return YES;
}


- (void)addChildVc:(UIViewController *)childVc title:(NSString *)title image:(NSString *)image selectImage:(NSString *)selectImage
{
    childVc.view.backgroundColor = BGRandomColor;
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [UIImage imageNamed: image];
    // 图片按原始样子显示，不自动渲染成其他颜色（如tabbarItem会默认变蓝色）
    UIImage *homeSelectedImage = [[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = homeSelectedImage;
    
    // 设置文字属性
    NSMutableDictionary *textAttri = [NSMutableDictionary dictionary];
    textAttri[NSForegroundColorAttributeName] = BGColor(123, 123, 123);
    NSMutableDictionary *selectTextAttri = [NSMutableDictionary dictionary];
    selectTextAttri[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [childVc.tabBarItem setTitleTextAttributes:textAttri forState:UIControlStateNormal];
    [childVc.tabBarItem setTitleTextAttributes:selectTextAttri forState:UIControlStateSelected];
    
    [self.tabbarVc addChildViewController:childVc];
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
