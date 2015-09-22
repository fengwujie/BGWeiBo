//
//  BGAccount.m
//  BGWeiBo
//
//  Created by fengwujie on 15/9/20.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGAccount.h"

@implementation BGAccount

+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    BGAccount *account = [[BGAccount alloc] init];
    account.access_token = dict[@"access_token"];
    account.expires_in = dict[@"expires_in"];
    account.uid = dict[@"uid"];
    
    // 获取账号存储的时间（accessToken产生时间）
    account.create_time = [NSDate date];
    
    return account;
}

/**
 *  当一个对象要归档到沙盒中时，就会调用这个方法
 *  目的：在这个方法中说明这个对象的哪些属性要存进沙盒中
 *
 *  @param encode <#aCoder description#>
 */
- (void)encodeWithCoder:(NSCoder *)encode{
    [encode encodeObject:self.access_token forKey:@"access_token"];
    [encode encodeObject:self.expires_in forKey:@"expires_in"];
    [encode encodeObject:self.uid forKey:@"uid"];
    [encode encodeObject:self.create_time forKey:@"create_time"];
}

/**
 *  当从沙盒中解档一个对象时，就会调用这个方法
 *  目的：在这个方法中说明沙盒中的属性要怎么解析（需要取出哪些改改）
 *
 *  @param decode <#decode description#>
 *
 *  @return <#return value description#>
 */
- (instancetype)initWithCoder:(NSCoder *)decode
{
    if (self = [super init]) {
        self.access_token = [decode decodeObjectForKey:@"access_token"];
        self.expires_in = [decode decodeObjectForKey:@"expires_in"];
        self.uid = [decode decodeObjectForKey:@"uid"];
        self.create_time = [decode decodeObjectForKey:@"create_time"];
    }
    return self;
}

@end
