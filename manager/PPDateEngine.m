//
//  PPDateEngine.m
//  rongChatDemo1
//
//  Created by vd on 2016/10/30.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "PPDateEngine.h"
#import "PPHTTPManager.h"
#import "PPHTTPResponse.h"
#import "rongChatDemo1-swift.h"


#define ContentType @"application/json"
#define kPPUrlHttp @"http://api.sealtalk.im/"
#define kPPUrlLoginUrl [NSString stringWithFormat:@"%@user/login",kPPUrlHttp]
#define kPPUrlRegisiter [NSString stringWithFormat:@"%@user/regisiter",kPPUrlHttp]
#define kPPUrlFriendsList [NSString stringWithFormat:@"%@friends",kPPUrlHttp]
//detail
//friendship/%@/profile
#define kPPUrlProfile(friendId) [NSString stringWithFormat:@"%@friendship/%@/profile",kPPUrlHttp,friendId]

#define kPPSendVirtifyCode [NSString stringWithFormat:@"%@user/send_code",kPPUrlHttp]

//friendship/all

#define kPPGetAllFriendsList [NSString stringWithFormat:@"%@friendship/all",kPPUrlHttp]


//user/send_code

//userInfo

#define kPPUrlUserInfo(userId) [NSString stringWithFormat:@"%@user/%@",kPPUrlHttp,userId]

//设置备注
#define kPPUrlSetDispalyName [NSString stringWithFormat:@"%@friendship/set_display_name",kPPUrlHttp]

// 获取版本的信息 ///misc/client_version

#define kPPUrlGetVersions [NSString stringWithFormat:@"%@misc/client_version",kPPUrlHttp]

@implementation PPDateEngine

+(instancetype)manager
{
    static dispatch_once_t token;
    static PPDateEngine * manager;
    dispatch_once(&token, ^{
        manager = [self new];
        
    });
    return manager;
}

- (void)_completeWithResponse:(PPHTTPResponse *)aResponse block:(PPResponseBlock())aResponseBlock
{
    if (aResponseBlock) {
        aResponseBlock(aResponse);
    }
}
- (void)loginWithWithResponse:(PPResponseBlock())aResponseBlock Phone:(NSString *)phone passWord:(NSString *)passWord region:(NSString *)region
{

    PPHTTPManager *manager = [PPHTTPManager manager];
    NSDictionary * dict = @{
                            @"region" : region,
                            @"phone" : phone,
                            @"password" : passWord};
    [manager POST:kPPUrlLoginUrl parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError * error;
        PPUserInfoTokenResponse * response = [MTLJSONAdapter modelOfClass:[PPUserInfoTokenResponse class] fromJSONDictionary:responseObject error:&error];
        NSString * token = ((PPTokenDef *)(response.result)).token;
        [self _completeWithResponse:response block:aResponseBlock];
        if(response.code.integerValue == kPPResponseSucessCode){
            [self getFriendListResponse:^(id aTaskResponse) {
                
            }];
        }
        [[PPChatTools shared]connectWithTokenWithToken:token sucessBlock:^(NSString * _Nullable content) {
            
            NSLog(@"%@",content);
            
        } errorBlock:^(RCConnectErrorCode code) {
            NSLog(@"code ==%d",code);
        
        } tokenIncorrectBlock:^{
            
        }];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        PPHTTPResponse *response = [PPHTTPResponse responseWithError:error];
        [self _completeWithResponse:response block:aResponseBlock];
        
    }];
    
}
/*
 
 + (void)getUserInfo:(NSString *)userId
 success:(void (^)(id response))success
 failure:(void (^)(NSError *err))failure {
 [AFHttpTool requestWihtMethod:RequestMethodTypeGet
 url:[NSString stringWithFormat:@"user/%@", userId]
 params:nil
 success:success
 failure:failure];
 */

- (void)requestGetUserInfoResponse:(PPResponseBlock())aResponseBlock userID:(NSString *)userId
{
    PPHTTPManager * manager = [PPHTTPManager manager];
    [manager GET:kPPUrlUserInfo(userId) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

- (void)regisiterWithResponse:(PPResponseBlock())aResponseBlock  userName:(NSString *)userName verficationToken:(NSString *)token passWord:(NSString *)passWord

{
    
}

/*
 + (void)registerWithNickname:(NSString *)nickname
 password:(NSString *)password
 verficationToken:(NSString *)verficationToken
 success:(void (^)(id response))success
 failure:(void (^)(NSError *err))failure {
 NSDictionary *params = @{
 @"nickname" : nickname,
 @"password" : password,
 @"verification_token" : verficationToken
 };
 
 [AFHttpTool requestWihtMethod:RequestMethodTypePost
 url:@"user/register"
 params:params
 success:success
 failure:failure];
 }
 */


//获取用户详细资料
- (void)getFriendDetailsByID:(NSString *)friendId
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError *err))failure
{
    
    PPHTTPManager * manager = [PPHTTPManager manager];
    [manager GET:kPPUrlUserInfo(friendId) parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

//设置好友备注
- (void)setFriendDisplayName:(NSString *)friendId
                 displayName:(NSString *)displayName
                     success:(void (^)(id response))success
                     failure:(void (^)(NSError *err))failure {
    NSDictionary *params = @{
                             @"friendId" : friendId,
                             @"displayName" : displayName
                             };
    PPHTTPManager * manager = [PPHTTPManager manager];
    [manager POST:kPPUrlSetDispalyName parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

//获取版本信息
- (void)getVersionsuccess:(void (^)(id response))success
                  failure:(void (^)(NSError *err))failure
{
    
    PPHTTPManager * manager = [PPHTTPManager manager];
    [manager GET:kPPUrlGetVersions parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];

}

- (void)sendVerifyWithResponse:(PPResponseBlock())aResponseBlock Code:(NSString *)phone;
{
    PPHTTPManager * manager = [PPHTTPManager manager];
    
}

- (void)getFriendListResponse:(PPResponseBlock())aResponseBlock
{
    PPHTTPManager * manager = [PPHTTPManager manager];
    [manager GET:kPPGetAllFriendsList parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSError * error;
        PPUserFriendListResponse * response = [MTLJSONAdapter modelOfClass:[PPUserFriendListResponse class] fromJSONDictionary:responseObject error:&error];
        
        
        NSLog(@"%@",responseObject);

    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
    }];
    
}

@end
