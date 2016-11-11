//
//  PPTDBEngine.m
//  rongChatDemo1
//
//  Created by vd on 2016/11/6.
//  Copyright © 2016年 vd. All rights reserved.
//

#define USER_INFO_TABLENAME @"USER_INFO_TABLENAME"

#import "PPTDBEngine.h"
#import "PPFileManager.h"
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
    
    NSString * dbPath = [[PPFileManager sharedManager]pathForDomain:PPFileDirDomain_User appendPathName:userID];
    dbPath = [dbPath stringByAppendingPathComponent:@"user.db"];
    NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    dbPath = [documentPath stringByAppendingPathComponent:@"members.db"];//成员列表数据库
    
    NSFileManager *fm = [[NSFileManager alloc]init];
    BOOL isNewUser = ![fm fileExistsAtPath:dbPath];
    
    self.db = [FMDatabase databaseWithPath:dbPath];
    if(![self.db open])
    {
        [fm removeItemAtPath:dbPath error:nil];
        self.db = [FMDatabase databaseWithPath:dbPath];
        [self createTables];
    }
    else if(isNewUser)
    {
        [self createTables];
    }
    [self.db close];
    
}
- (void)createTables
{
    
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
