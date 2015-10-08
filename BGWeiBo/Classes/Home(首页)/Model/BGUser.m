//
//  BGUser.m
//  BGWeiBo
//
//  Created by fengwujie on 15/9/23.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGUser.h"

@implementation BGUser

- (void)setMbtype:(int)mbtype
{
    _mbtype = mbtype;
    
    self.vip = mbtype > 2;
}

//- (BOOL)isVip
//{
//    return self.mbrank > 2;
//}

@end
