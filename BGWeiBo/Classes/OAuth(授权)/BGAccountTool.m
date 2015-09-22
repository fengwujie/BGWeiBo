//
//  BGAccountTool.m
//  BGWeiBo
//
//  Created by fengwujie on 15/9/22.
//  Copyright © 2015年 BG. All rights reserved.
//

#import "BGAccountTool.h"

#define BGAccountFile [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.data"]
@implementation BGAccountTool

+(void)saveAccount:(BGAccount *)account{
    // 将模型转保存到沙盒文件中；自定义对象的存储必须用NSKeyedArchiver，不再用WriteToFile方法
    [NSKeyedArchiver archiveRootObject:account toFile:BGAccountFile];
}

+(BGAccount *)account{
    BGAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:BGAccountFile];
    if (!account) return nil;
    
    // 验证账号是否过期
    // 过期的秒数
    long long expires_in = [account.expires_in longLongValue];
    
    // 获得过期时间
    NSDate *expiresTime = [account.create_time dateByAddingTimeInterval:expires_in];
    // 获得当前时间
    NSDate *now = [NSDate date ];
    
    // expiresTime<=now，表示过期
    /*
    NSOrderedAscending 升序，右边>左边
    NSOrderedSame 一样
    NSOrderedDescending 降序，左边>右边
     */
    if ([now compare:expiresTime] != NSOrderedAscending) {
        return  nil;
    }
    
    return account;
}

@end
