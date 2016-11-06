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
// 登陆
- (void)loginWithWithResponse:(PPResponseBlock())aResponseBlock Phone:(NSString *)phone passWord:(NSString *)passWord region:(NSString *)region;
//注册
- (void)registerWithResponse:(PPResponseBlock())aResponseBlock Phone:(NSString *)phone passWord:(NSString *)passWord verifyCode:(NSString *)code andNickName:(NSString *)nickName;
//发送验证码
- (void)sendVerifyWithResponse:(PPResponseBlock())aResponseBlock phone:(NSString *)phoneNumber regionString:(NSString *)region;
//获取 friendList
- (void)getFriendListResponse:(PPResponseBlock())aResponseBlock;
//kPPUrlProfile 查询用户的信息
- (void)searchUserInfoResponse:(PPResponseBlock())aResponseBlock friendID:(NSString *)friendid;

//修改密码
- (void)requestResponse:(PPResponseBlock())aResponseBlock
         changePassWord:(NSString *)newPassWord oldPassWord:(NSString * )oldPassWord;

//重置密码

- (void)requestResetPassWordResponse:(PPResponseBlock())aResponseBlock resetPassWord:(NSString *)passWord verification_token:(NSString *)token;
//更新用户的昵称
- (void)requestUpdateNickNameResponse:(PPResponseBlock())aResponseBlock nickName:(NSString *)nickName;

- (void)requestUploadImageToken:(PPResponseBlock())aResponseBlock;

- (void)requsetResponse:(PPResponseBlock())aResponseBlock UploadFile:(NSData *)imageData UserId:(NSString *)auserId;


@end
