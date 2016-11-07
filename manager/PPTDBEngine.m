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

- (void)loadDataBase:(NSString *)userID
{
    
    
    self.db = [[FMDatabase alloc]initWithPath:@""];
    if([self.db open])
    {
        
    }else
    {
        
    }
}

- (void)saveUserInfo:(PPUserBase *)baseInfo
{
    
}

- (void)createUser_Info_TableName
{
    
    NSString * createUser_Info = [NSString stringWithFormat:@"create table  if not exists %@(indexId text  primary key not null,nickname text,displayName text,portraitUri text,updatedAt text,phone text,region text,isSelf bool)",USER_INFO_TABLENAME];
    
    
}

- (void)saveFriendList:(NSArray <PPUserBaseInfo *> *)arr
{
    
}


@end
