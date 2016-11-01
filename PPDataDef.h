//
//  PPDataDef.h
//  rongChatDemo1
//
//  Created by vd on 2016/10/30.
//  Copyright © 2016年 vd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
@interface PPDataDef : MTLModel <MTLJSONSerializing>

@end

@interface PPTokenDef : PPDataDef

@property (nonatomic,strong) NSString * indexId;
@property (nonatomic,strong) NSString * token;

@end

@interface PPPersonal : PPDataDef
@property (nonatomic,strong) NSString * leftIconName;
@property (nonatomic,strong) NSString * rightIconName;
@property (nonatomic,strong) NSString * content;

@end

