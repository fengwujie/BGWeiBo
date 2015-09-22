//
//  BGAccountTool.h
//  BGWeiBo
//
//  Created by fengwujie on 15/9/22.
//  Copyright © 2015年 BG. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BGAccount;

@interface BGAccountTool : NSObject

/**
 *  保存账号信息
 *
 *  @param account <#account description#>
 */
+ (void) saveAccount:(BGAccount *)account;

/**
 *  获取账号信息，如果过期的话返回NIL
 *
 *  @return <#return value description#>
 */
+ (BGAccount *) account;

@end
