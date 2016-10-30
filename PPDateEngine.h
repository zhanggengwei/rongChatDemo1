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

+ (void)loginWithphone:(NSString *)phone passWord:(NSString *)passWord region:(NSString *)region;





@end
