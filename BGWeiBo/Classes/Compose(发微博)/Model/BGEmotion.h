//
//  BGEmotion.h
//  BGWeiBo
//
//  Created by fengwujie on 15/10/27.
//  Copyright © 2015年 BG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGEmotion : UIView

/** 表情的文字描述 */
@property (nonatomic, copy) NSString *chs;
/** 表情的png图片名 */
@property (nonatomic, copy) NSString *png;
/** emoji表情的16进制编码 */
@property (nonatomic, copy) NSString *code;

@end
