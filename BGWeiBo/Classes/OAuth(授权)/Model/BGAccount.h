//
//  BGAccount.h
//  BGWeiBo
//
//  Created by fengwujie on 15/9/20.
//  Copyright © 2015年 BG. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGAccount : NSObject <NSCoding>

/**
 *  账号的accesstoken
 */
@property (nonatomic, copy) NSString *access_token;
/**
 *  access_token的有效时间，秒单位
 */
@property (nonatomic, copy) NSNumber *expires_in;
/**
 *  用户的UID
 */
@property (nonatomic, copy) NSString *uid;

/**
 *  账号的创建时间，access_token的创建时间
 */
@property (nonatomic, strong) NSDate *create_time;

/**
 *  将字典转换成模型
 *
 *  @param dict <#dict description#>
 *
 *  @return <#return value description#>
 */
+ (instancetype) accountWithDict:(NSDictionary *)dict;

@end
