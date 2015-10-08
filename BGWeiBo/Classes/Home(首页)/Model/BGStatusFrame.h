//
//  BGStatusFrame.h
//  BGWeiBo
//
//  Created by fengwujie on 15/10/8.
//  Copyright © 2015年 BG. All rights reserved.
//  一个BGStatusFrame模型里面包含的信息
//  1.存放着一个cell内部所有子控件的frame数据
//  2.存放一个cell的高度
//  3.存放着一个数据模型BGStatus

#import <Foundation/Foundation.h>



// 昵称字体
#define BGStatusCellNameFont [UIFont systemFontOfSize:15]
// 时间字体
#define BGStatusCellTimeFont [UIFont systemFontOfSize:12]
// 来源字体
#define BGStatusCellSourceFont BGStatusCellTimeFont
// 正文字体
#define BGStatusCellContentFont [UIFont systemFontOfSize:14]

// 被转发微博的正文字体
#define BGStatusCellRetweetContentFont [UIFont systemFontOfSize:13]

// cell之间的间距
#define BGStatusCellMargin 15

// cell的边框宽度
#define BGStatusCellBorderW 10
@class BGStatus;

@interface BGStatusFrame : NSObject

@property (nonatomic, strong) BGStatus *status;

/** 原创微博整体 */
@property (nonatomic, assign) CGRect originalViewF;
/** 头像 */
@property (nonatomic, assign) CGRect iconViewF;
/** 会员图标 */
@property (nonatomic, assign) CGRect vipViewF;
/** 配图 */
@property (nonatomic, assign) CGRect photosViewF;
/** 昵称 */
@property (nonatomic, assign) CGRect nameLabelF;
/** 时间 */
@property (nonatomic, assign) CGRect timeLabelF;
/** 来源 */
@property (nonatomic, assign) CGRect sourceLabelF;
/** 正文 */
@property (nonatomic, assign) CGRect contentLabelF;

/** 转发微博整体 */
@property (nonatomic, assign) CGRect retweetViewF;
/** 转发微博正文 + 昵称 */
@property (nonatomic, assign) CGRect retweetContentLabelF;
/** 转发配图 */
@property (nonatomic, assign) CGRect retweetPhotosViewF;

/** 底部工具条 */
@property (nonatomic, assign) CGRect toolbarF;

/** cell的高度 */
@property (nonatomic, assign) CGFloat cellHeight;

@end
