//
//  BGTabBar.h
//  BGWeiBo
//
//  Created by apple on 14-10-8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGTabBar;

// 因为BGTabBar继承自UITabBar，所以称为BGTabBar的代理，也必须实现UITabBar的代理协议
@protocol BGTabBarDelegate <UITabBarDelegate>
@optional
- (void)tabBarDidClickPlusButton:(BGTabBar *)tabBar;
@end

@interface BGTabBar : UITabBar
@property (nonatomic, weak) id<BGTabBarDelegate> delegate;
@end
