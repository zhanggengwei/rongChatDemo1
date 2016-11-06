//
//  PPTDBEngine.m
//  rongChatDemo1
//
//  Created by vd on 2016/11/6.
//  Copyright © 2016年 vd. All rights reserved.
//

#define USER_INFO_TABLENAME @"USER_INFO_TABLENAME"

#import "PPTDBEngine.h"

@interface PPTDBEngine ()
@property (nonatomic,strong) FMDatabase * db;


@end

@implementation PPTDBEngine
// 数据库的管理类

+ (instancetype)shareManager
{
    static dispatch_once_t token;
    static PPTDBEngine * shareInstance;
    
    dispatch_once(&token, ^{
        shareInstance = [self new];
    });
    return shareInstance;
}
- (void)saveUserInfo:(PPUserBase *)baseInfo
{
    
}

@end
