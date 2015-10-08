//
//  BGStatusPhotosView.h
//  BGWeiBo
//
//  Created by fengwujie on 15/10/8.
//  Copyright © 2015年 BG. All rights reserved.
//  cell上面的配图相册（里面会显示1~9张图片, 里面都是HWStatusPhotoView）

#import <UIKit/UIKit.h>

@interface BGStatusPhotosView : UIView

@property (nonatomic, strong) NSArray *photos;

/**
 *  根据图片个数计算相册的尺寸
 */
+ (CGSize)sizeWithCount:(NSUInteger)count;
@end
