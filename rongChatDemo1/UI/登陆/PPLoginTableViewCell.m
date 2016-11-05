//
//  PPLoginTableViewCell.m
//  rongChatDemo1
//
//  Created by vd on 2016/11/5.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "PPLoginTableViewCell.h"
#import "UITextField+UITextField_WJ.h"

@interface PPLoginTableViewCell ()<UITextFieldDelegate,WJTextFieldDelegate>
@property (nonatomic,strong) UILabel * content;
@property (nonatomic,strong) UILabel * leftLabel;
@property (nonatomic,strong) UITextField * leftText;
@property (nonatomic,strong) UITextField * rightText;
@property (nonatomic,strong) UIImageView * lineImageView;
@property (nonatomic,strong) UIImageView * topBottomImageView;
@property (nonatomic,assign) PPLoginTableViewCellStyle style;

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
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(100);
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
    
    
    self.rightText = [UITextField new];
    [self.contentView addSubview:self.rightText];
    
    [self.rightText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.mas_equalTo(self.contentView.mas_left).mas_offset(100);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.right.mas_equalTo(self.mas_right);
        
    }];
    
    self.leftText = [UITextField new];
    [self.contentView addSubview:self.leftText];
    
    [self.leftText mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.mas_left).mas_offset(10);
        make.top.mas_equalTo(self.mas_top);
        make.bottom.mas_equalTo(self.mas_bottom);
        make.width.mas_equalTo(70);
    }];
    
    self.leftText.font = [UIFont systemFontOfSize:15];
    self.rightText.font = [UIFont systemFontOfSize:15];
    self.leftText.WJDelegate = self;
    
    
    
}

- (void)layoutLeftContent:(NSString *)left content:(NSString *)content andStyle:(PPLoginTableViewCellStyle)style
{
    self.style = style;
    self.leftLabel.text = left;
    self.content.text = content;
    
    if(self.style == PPLoginTableViewCellDefault)
    {
        self.topBottomImageView.hidden = YES;
        self.rightText.hidden = YES;
        self.leftText.hidden = YES;
    }else if (self.style == PPLoginTableViewCellTextField)
    {
        self.topBottomImageView.hidden = NO;
        self.content.hidden = YES;
        self.leftText.text = left;
        self.rightText.placeholder = content;
        self.leftLabel.hidden = YES;
        self.leftText.hidden = NO;
        
    }else
    {
        self.leftText.hidden = YES;
        self.leftLabel.hidden = NO;
        self.content.hidden = YES;
        self.rightText.hidden = NO;
        self.leftLabel.text = left;
        self.rightText.placeholder = content;
        self.topBottomImageView.hidden = YES;
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range
{
    if(range.location>=1)
    {
        return YES;
    }
    return NO;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    if(textField.text.length==1)
    {
        return YES;
    }
    return NO;
}

- (void)textFieldDidDeleteBackward:(UITextField *)textField
{
    
}



@end
