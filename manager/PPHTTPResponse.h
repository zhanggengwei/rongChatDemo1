//
//  PPHTTPResponse.h
//  rongChatDemo1
//
//  Created by vd on 2016/10/30.
//  Copyright © 2016年 vd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "PPDataDef.h"

@interface PPHTTPResponse : MTLModel<MTLJSONSerializing>

//返回结果
@property (nonatomic, strong) id result;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSNumber *code;

+ (id)responseWithError:(NSError *)aError;
@end

@interface PPUserInfoTokenResponse : PPHTTPResponse

@end


@interface PPUserFriendListResponse : PPHTTPResponse

@end

@interface PPUserBaseInfoResponse :PPHTTPResponse
@end


@interface PPUploadImageTokenResponse : PPHTTPResponse


@end
