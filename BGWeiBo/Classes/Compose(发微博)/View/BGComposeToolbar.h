//
//  BGComposeToolbar.h
//  BGWeiBo
//
//  Created by fengwujie on 15/10/20.
//  Copyright © 2015年 BG. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    BGComposeToolbarButtonTypeCamera, // 拍照
    BGComposeToolbarButtonTypePicture, // 相册
    BGComposeToolbarButtonTypeMention, // @
    BGComposeToolbarButtonTypeTrend, // #
    BGComposeToolbarButtonTypeEmotion // 表情
} BGComposeToolbarButtonType;

@class BGComposeToolbar;

@protocol BGComposeToolbarDelegate <NSObject>

@optional
- (void)composeToolbar:(BGComposeToolbar *)toolbar didClickButton:(BGComposeToolbarButtonType)buttonType;

@end

@interface BGComposeToolbar : UIView
@property (nonatomic, weak) id<BGComposeToolbarDelegate> delegate;
/** 是否要显示键盘按钮  */
@property (nonatomic, assign) BOOL showKeyboardButton;
@end
