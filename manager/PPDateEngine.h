//
//  PPDateEngine.h
//  rongChatDemo1
//
//  Created by vd on 2016/10/30.
//  Copyright © 2016年 vd. All rights reserved.
//

#import <Foundation/Foundation.h>

#define PPResponseBlock(blockName) void(^blockName)(id aTaskResponse)


@interface PPDateEngine : NSObject

+(instancetype)manager;

- (void)loginWithWithResponse:(PPResponseBlock())aResponseBlock Phone:(NSString *)phone passWord:(NSString *)passWord region:(NSString *)region;

- (void)registerWithResponse:(PPResponseBlock())aResponseBlock Phone:(NSString *)phone passWord:(NSString *)passWord verifyCode:(NSString *)code andNickName:(NSString *)nickName;

- (void)sendVerifyWithResponse:(PPResponseBlock())aResponseBlock Code:(NSString *)phone;


- (void)getFriendListResponse:(PPResponseBlock())aResponseBlock;






@end
