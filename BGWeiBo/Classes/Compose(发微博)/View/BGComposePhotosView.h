//
//  BGComposePhotosView.h
//  BGWeiBo
//
//  Created by fengwujie on 15/10/20.
//  Copyright © 2015年 BG. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BGComposePhotosView : UIView

- (void)addPhoto:(UIImage *)photo;

@property (nonatomic, strong, readonly) NSMutableArray *photos;

@end
