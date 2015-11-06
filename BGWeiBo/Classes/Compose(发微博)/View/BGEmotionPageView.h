//
//  BGEmotionPageView.h
//  BGWeiBo
//
//  Created by fengwujie on 15/10/27.
//  Copyright © 2015年 BG. All rights reserved.
//  用来表示一页的表情（里面显示1~20个表情）

#import <UIKit/UIKit.h>

// 一页中最多3行
#define HWEmotionMaxRows 3
// 一行中最多7列
#define HWEmotionMaxCols 7
// 每一页的表情个数
#define HWEmotionPageSize ((HWEmotionMaxRows * HWEmotionMaxCols) - 1)

@interface BGEmotionPageView : UIView
/** 这一页显示的表情（里面都是BGEmotion模型） */
@property (nonatomic, strong) NSArray *emotions;
@end
