//
//  PPTDBEngine.m
//  rongChatDemo1
//
//  Created by vd on 2016/11/6.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "PPTDBEngine.h"

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

@end
