//
//  BGStatusPhotosView.m
//  BGWeiBo
//
//  Created by fengwujie on 15/10/8.
//  Copyright © 2015年 BG. All rights reserved.
//  

#import "BGStatusPhotosView.h"
#import "BGPhoto.h"
#import "BGStatusPhotoView.h"

#define BGStatusPhotoWH 70
#define BGStatusPhotoMargin 10
#define BGStatusPhotoMaxCol(count) ((count==4)?2:3)


@implementation BGStatusPhotosView
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setPhotos:(NSArray *)photos
{
    _photos = photos;
    
    NSUInteger photosCount = photos.count;
    
    // 创建足够数量的图片控件
    // 这里的self.subviews.count不要单独赋值给其他变量
    while (self.subviews.count < photosCount) {
        BGStatusPhotoView *photoView = [[BGStatusPhotoView alloc] init];
        [self addSubview:photoView];
    }
    
    // 遍历所有的图片控件，设置图片
    for (int i = 0; i<self.subviews.count; i++) {
        BGStatusPhotoView *photoView = self.subviews[i];
        
        if (i < photosCount) { // 显示
            photoView.photo = photos[i];
            photoView.hidden = NO;
        } else { // 隐藏
            photoView.hidden = YES;
        }
    }
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // 设置图片的尺寸和位置
    NSUInteger photosCount = self.photos.count;
    int maxCol = BGStatusPhotoMaxCol(photosCount);
    for (int i = 0; i<photosCount; i++) {
        BGStatusPhotoView *photoView = self.subviews[i];
        
        int col = i % maxCol;
        photoView.x = col * (BGStatusPhotoWH + BGStatusPhotoMargin);
        
        int row = i / maxCol;
        photoView.y = row * (BGStatusPhotoWH + BGStatusPhotoMargin);
        photoView.width = BGStatusPhotoWH;
        photoView.height = BGStatusPhotoWH;
    }
}

+ (CGSize)sizeWithCount:(NSUInteger)count
{
    // 最大列数（一行最多有多少列）
    int maxCols = BGStatusPhotoMaxCol(count);
    
    NSUInteger cols = (count >= maxCols)? maxCols : count;
    CGFloat photosW = cols * BGStatusPhotoWH + (cols - 1) * BGStatusPhotoMargin;
    
    // 行数
    NSUInteger rows = (count + maxCols - 1) / maxCols;
    CGFloat photosH = rows * BGStatusPhotoWH + (rows - 1) * BGStatusPhotoMargin;
    
    return CGSizeMake(photosW, photosH);
}
@end
