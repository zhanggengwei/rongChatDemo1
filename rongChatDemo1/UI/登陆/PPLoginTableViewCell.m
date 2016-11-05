//
//  PPLoginTableViewCell.m
//  rongChatDemo1
//
//  Created by vd on 2016/11/5.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "PPLoginTableViewCell.h"

@interface PPLoginTableViewCell ()
@property (nonatomic,strong) UILabel * content;
@property (nonatomic,strong) UILabel * leftLabel;
@property (nonatomic,strong) UITextField * leftText;
@property (nonatomic,strong) UITextField * rightText;
@property (nonatomic,strong) UIImageView * lineImageView;
@property (nonatomic,strong) UIImageView * topBottomImageView;


@end

@implementation PPLoginTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
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
    self.leftLabel = [UILabel new];
    
    [self.contentView addSubview:self.leftLabel];
    
    [self.leftLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(70);
    }];
    
    self.content = [UILabel new];
    
    [self.contentView addSubview:self.content];
    
    [self.content mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.leftLabel.mas_right).mas_offset(20);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.right.mas_equalTo(self.mas_right);
    }];
    
    self.leftLabel.font = [UIFont systemFontOfSize:15];
    self.content.font = [UIFont systemFontOfSize:15];
    
    self.lineImageView = [UIImageView new];
    
    [self.contentView addSubview:self.lineImageView];
    
    [self.lineImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(10);
        make.width.mas_equalTo([UIScreen mainScreen].bounds.size.width - 10);
        make.bottom.mas_equalTo(self.contentView.mas_bottom);
        make.height.mas_equalTo(0.5);
    }];
    self.lineImageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    self.topBottomImageView = [UIImageView new];
    
    [self.contentView addSubview:self.topBottomImageView];
    
    [self.topBottomImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(90);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(1);
    }];
    self.topBottomImageView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
}

- (void)layoutLeftContent:(NSString *)left content:(NSString *)content
{
    self.leftLabel.text = left;
    self.content.text = content;
}




@end
