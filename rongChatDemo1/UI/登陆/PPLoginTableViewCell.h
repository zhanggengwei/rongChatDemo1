//
//  PPLoginTableViewCell.h
//  rongChatDemo1
//
//  Created by vd on 2016/11/5.
//  Copyright © 2016年 vd. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    PPLoginTableViewCellDefault,
    PPLoginTableViewCellTextField,
    PPLoginTableViewCellNotLine
} PPLoginTableViewCellStyle;


@interface PPLoginTableViewCell : UITableViewCell

@property (nonatomic,assign,readonly) PPLoginTableViewCellStyle style;

- (void)layoutLeftContent:(NSString *)left content:(NSString *)content andStyle:(PPLoginTableViewCellStyle)style;



@end
