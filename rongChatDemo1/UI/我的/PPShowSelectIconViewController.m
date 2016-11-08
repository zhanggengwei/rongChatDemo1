//
//  PPShowSelectIconViewController.m
//  rongChatDemo1
//
//  Created by Donald on 16/11/8.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "PPShowSelectIconViewController.h"

@interface PPShowSelectIconViewController ()
@property (nonatomic,strong) UIImageView * imageView;

@end

@implementation PPShowSelectIconViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"个人头像";
    self.imageView = [UIImageView new];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.view.mas_centerY);
        make.width.mas_equalTo(OBJC_SCREEN_WIDTH);
        make.height.mas_equalTo(OBJC_SCREEN_WIDTH);
        make.left.mas_equalTo(self.view.mas_left);
        
    }];
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:@"http://pic6.huitu.com/res/20130116/84481_20130116142820494200_1.jpg"]];
    
    self.view.backgroundColor = [UIColor blackColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:nil];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
