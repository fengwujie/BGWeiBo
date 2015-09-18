//
//  BGDropdownMenu.h
//  BGWeiBo
//
//  Created by apple on 14-10-8.
//  Copyright (c) 2014年 heima. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BGDropdownMenu;

@protocol BGDropdownMenuDelegate <NSObject>
@optional
- (void)dropdownMenuDidDismiss:(BGDropdownMenu *)menu;
- (void)dropdownMenuDidShow:(BGDropdownMenu *)menu;
@end

@interface BGDropdownMenu : UIView
@property (nonatomic, weak) id<BGDropdownMenuDelegate> delegate;

+ (instancetype)menu;

/**
 *  显示
 */
- (void)showFrom:(UIView *)from;
/**
 *  销毁
 */
- (void)dismiss;

/**
 *  内容
 */
@property (nonatomic, strong) UIView *content;
/**
 *  内容控制器
 */
@property (nonatomic, strong) UIViewController *contentController;
@end
