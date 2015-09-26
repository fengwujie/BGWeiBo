//
//  BGLoadMoreFooter.m
//  BGWeiBo
//
//  Created by fengwujie on 15/9/23.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGLoadMoreFooter.h"

@implementation BGLoadMoreFooter

+ (instancetype)footer
{
    return [[[NSBundle mainBundle] loadNibNamed:@"BGLoadMoreFooter" owner:nil options:nil] lastObject];
}

@end
