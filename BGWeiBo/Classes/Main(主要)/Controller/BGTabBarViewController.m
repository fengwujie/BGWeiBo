//
//  BGTabBarViewController.m
//  BGWeiBo
//
//  Created by fengwujie on 15/9/14.
//  Copyright (c) 2015年 BG. All rights reserved.
//  主控制器

#import "BGTabBarViewController.h"
#import "BGHomeViewController.h"
#import "BGMessageCenterViewController.h"
#import "BGDiscoverViewController.h"
#import "BGProfileViewController.h"

@interface BGTabBarViewController ()

@end

@implementation BGTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 1.初始化子控制器
    BGHomeViewController *home = [[BGHomeViewController alloc] init];
    [self addChildVc: home title:@"首页" image:@"tabbar_home" selectImage:@"tabbar_home_selected"];
    BGMessageCenterViewController *messageCenter = [[BGMessageCenterViewController alloc] init];
    [self addChildVc:messageCenter title:@"消息" image:@"tabbar_message_center" selectImage:@"tabbar_message_center_selected"];
    BGDiscoverViewController *discover = [[BGDiscoverViewController alloc] init];
    [self addChildVc:discover title:@"发现" image:@"tabbar_discover" selectImage:@"tabbar_discover_selected"];
    BGProfileViewController *profile = [[BGProfileViewController alloc] init];
    [self addChildVc: profile title:@"我" image:@"tabbar_profile" selectImage:@"tabbar_profile_selected"];
    
}


/**
 *  添加一个子控制器
 *
 *  @param childVc     子控制器
 *  @param title       文本
 *  @param image       默认图片
 *  @param selectImage 选中图片
 */
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
    
    // 先把传进来的小控制器包装到一个导航控制器中
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:childVc];
    
    // 添加一个子控制器
    [self addChildViewController:nav];
}
@end
