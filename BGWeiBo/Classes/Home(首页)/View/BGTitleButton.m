//
//  BGTitleButton.m
//  BGWeiBo
//
//  Created by fengwujie on 15/9/23.
//  Copyright © 2015年 BG. All rights reserved.
//  标题按钮

#import "BGTitleButton.h"
#define BGTitleButtonImageW 20

@implementation BGTitleButton
+ (instancetype)titleButton
{
    return [[self alloc] init];
}

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        // 高亮的时候不要自动调整图标
        self.adjustsImageWhenHighlighted = NO;
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont boldSystemFontOfSize:17];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_down"] forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"navigationbar_arrow_up"] forState:UIControlStateSelected];
    }
    return self;
}

/**
 *  设置按钮内部imageView的frame
 *
 *  @param contentRect 按钮的bounds
 */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGFloat imageY = 0;
    CGFloat imageW = BGTitleButtonImageW;
    CGFloat imageX = contentRect.size.width - imageW;
    CGFloat imageH = contentRect.size.height;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
/**
 *  设置按钮内部titleLable的frame
 *
 *  @param contentRect 按钮的bounds
 */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY = 0;
    CGFloat titleX = 0;
    CGFloat titleW = contentRect.size.width - BGTitleButtonImageW;
    CGFloat titleH = contentRect.size.height;
    return CGRectMake(titleX, titleY, titleW, titleH);
}

//- (void)layoutSubviews{
//    [super layoutSubviews];
//    
//    // 如果仅仅只是调整titileLable和imageView的位置，只需要重写layoutSubviews即可
//    // 1.计算titileLable的frame;
//    self.titleLabel.x = self.imageView.x;
//    
//    // 2.计算出imageView的frame
//    self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
//    
//}

- (void)setTitle:(NSString *)title forState:(UIControlState)state
{
    // 根据title计算自己的宽度
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] = self.titleLabel.font;
    CGFloat titleW = [self.currentTitle sizeWithAttributes:attrs].width;
    //CGFloat titleW = [title sizeWithFont:self.titleLabel.font].width;
    
    CGRect frame = self.frame;
    frame.size.width = titleW + BGTitleButtonImageW + 5;
    self.frame = frame;
    
    [super setTitle:title forState:state];
    
//    [super setTitle:title forState:state];
//    [self sizeToFit];
}

//- (void)setImage:(UIImage *)image forState:(UIControlState)state
//{
//    [super setImage:image forState:state];
//    [self sizeToFit];
//}

@end
