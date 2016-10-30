//
//  PPDateEngine.m
//  rongChatDemo1
//
//  Created by vd on 2016/10/30.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "PPDateEngine.h"
#import "PPHTTPManager.h"
#define ContentType @"application/json"

NSString *  loginUrl = @"http://api.sealtalk.im/user/login";


@implementation PPDateEngine
+ (void)loginWithphone:(NSString *)phone passWord:(NSString *)passWord region:(NSString *)region
{
    
    //PPHTTPManager * manager = [PPHTTPManager manager];
    AFHTTPRequestOperationManager *manager =
    [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:@"http://api.sealtalk.im/"]];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes =
    [NSSet setWithObjects:ContentType, nil];
    NSDictionary * dict = @{
    @"region" : region,
    @"phone" : phone,
    @"password" : passWord};
    manager.responseSerializer.acceptableContentTypes=[NSSet setWithObjects:@"application/json",@"text/json",@"text/javascript",@"text/html",nil];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.requestSerializer.HTTPShouldHandleCookies = YES;
   NSString * url =  [@"user/login" stringByAddingPercentEscapesUsingEncoding: NSUTF8StringEncoding];
    
    //user/login
    [manager POST:url parameters:dict success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"%@",responseObject);
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"%@",error);
        
        
    }];
    
}
@end
