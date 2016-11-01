//
//  PPPersonTableViewCell.m
//  rongChatDemo1
//
//  Created by vd on 2016/11/1.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "PPPersonTableViewCell.h"
//@class PPPersonal;

@interface PPPersonTableViewCell ()
@property (nonatomic,strong) UIImageView * leftIcon;
@property (nonatomic,strong) UIImageView * rightIcon;
@property (nonatomic,strong) UILabel * contentLabel;
@property (nonatomic,assign) PPPersonTableViewCellStyle style;


@end

@implementation PPPersonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self createUI];
        
    }
    return self;
}
- (void)createUI
{
    self.leftIcon = [UIImageView new];
    self.rightIcon = [UIImageView new];
    self.contentLabel = [UILabel new];
    
}

- (void)layoutData:(PPPersonTableViewCellStyle)style cellModel:(PPPersonal *)model
{
    
}



@end
