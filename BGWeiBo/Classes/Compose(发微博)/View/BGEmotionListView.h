//
//  BGEmotionListView.h
//  BGWeiBo
//
//  Created by fengwujie on 15/10/27.
//  Copyright © 2015年 BG. All rights reserved.
//  表情键盘顶部的内容:scrollView + pageControl

#import <UIKit/UIKit.h>

@interface BGEmotionListView : UIView
/** 表情(里面存放的BGEmotion模型) */
@property (nonatomic, strong) NSArray *emotions;
@end
