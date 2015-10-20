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
#import "BGNavigationController.h"
#import "BGTabBar.h"
#import "BGComposeViewController.h"

@interface BGTabBarViewController ()<BGTabBarDelegate>

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
    // 2.更换系统自带的tabbar
    BGTabBar *tabBar = [[BGTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
    
    /*
     [self setValue:tabBar forKeyPath:@"tabBar"];相当于self.tabBar = tabBar;
     [self setValue:tabBar forKeyPath:@"tabBar"];这行代码过后，tabBar的delegate就是HWTabBarViewController
     说明，不用再设置tabBar.delegate = self;
     */
    
    /*
     1.如果tabBar设置完delegate后，再执行下面代码修改delegate，就会报错
     tabBar.delegate = self;
     
     2.如果再次修改tabBar的delegate属性，就会报下面的错误
     错误信息：Changing the delegate of a tab bar managed by a tab bar controller is not allowed.
     错误意思：不允许修改TabBar的delegate属性(这个TabBar是被TabBarViewController所管理的)
     */
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
    //childVc.view.backgroundColor = BGRandomColor;
    //childVc.tabBarItem.title = title;
    childVc.title = title;
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
    BGNavigationController *nav = [[BGNavigationController alloc] initWithRootViewController:childVc];
    
    // 添加一个子控制器
    [self addChildViewController:nav];
}

#pragma mark BGTabBar代理方法
/**
 *  加号按钮的代理
 *
 *  @param tabBar <#tabBar description#>
 */
-(void)tabBarDidClickPlusButton:(BGTabBar *)tabBar{
    BGComposeViewController *compose = [[BGComposeViewController alloc] init];
    BGNavigationController *nav = [[BGNavigationController alloc] initWithRootViewController:compose];
    [self presentViewController:nav animated:YES completion:nil];
}
@end
