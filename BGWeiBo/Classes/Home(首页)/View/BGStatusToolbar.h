//
//  BGStatusToolbar.h
//  BGWeiBo
//
//  Created by fengwujie on 15/10/8.
//  Copyright © 2015年 BG. All rights reserved.
//  底部按钮，评论、转发、赞

#import <UIKit/UIKit.h>
@class BGStatus;
@interface BGStatusToolbar : UIView
+ (instancetype)toolbar;
@property (nonatomic, strong) BGStatus *status;
@end
