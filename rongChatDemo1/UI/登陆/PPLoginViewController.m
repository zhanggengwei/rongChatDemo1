//
//  PPLoginViewController.m
//  rongChatDemo1
//
//  Created by vd on 2016/11/5.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "PPLoginViewController.h"
#import "PPLoginTableViewCell.h"
#import "rongChatDemo1-swift.h"

@interface PPLoginViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;
@property (nonatomic,strong) UILabel * headerView;
@property (nonatomic,strong) UIView * footerView;
@property (nonatomic,strong) UIBarButtonItem * item;
@end

@implementation PPLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.item = [[UIBarButtonItem alloc]initWithTitle:@"取消" style:UIBarButtonItemStylePlain target:self action:@selector(cancelAction:)];

    self.navigationItem.leftBarButtonItem = self.item;
    self.item.tintColor = [UIColor colorWithRed:0 green:200 blue:0 alpha:1];
    [self createUI];
    [self createLoginNavBarStryle];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)createLoginNavBarStryle
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    UINavigationBar *  bar = [UINavigationBar appearance];
    bar.barTintColor = [UIColor whiteColor];
    self.navigationController.navigationBar.clipsToBounds = YES;
}

- (void)createUI{
    
    self.headerView = [[UILabel alloc]initWithFrame:CGRectMake(0, 0,self.view.frame.size.width, 0)];
    self.headerView.font = [UIFont systemFontOfSize:18];
    self.headerView.text = @"使用手机号码登陆";
    self.headerView.textAlignment = NSTextAlignmentCenter;
    self.footerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, PPMachios.SCREEN_WIDTH, 0)];
    
    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,64,PPMachios.SCREEN_WIDTH, PPMachios.SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.backgroundColor = [UIColor whiteColor];
   
    [self.tableView registerClass:[PPLoginTableViewCell class] forCellReuseIdentifier:@"PPLoginTableViewCell"];
    self.tableView.contentInset = UIEdgeInsetsMake(-64.0f,.0f, 0.0f, 0.0f);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    UIButton * loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.footerView addSubview:loginBtn];
    
    [loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.footerView.mas_top).mas_offset(10);
        make.left.mas_equalTo(self.footerView.mas_left).mas_offset(31);
        make.right.mas_equalTo(self.footerView.mas_right).mas_offset(-31);
        make.height.mas_equalTo(35);
    }];
    loginBtn.backgroundColor = [UIColor yellowColor];
    
    UIButton * emailBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [self.footerView addSubview:emailBtn];
    
    [emailBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.footerView.mas_left);
        make.right.mas_equalTo(self.footerView.mas_right);
        make.top.mas_equalTo(loginBtn.mas_bottom).mas_offset(10);
        make.height.mas_equalTo(16);
    }];
    [emailBtn setTitleColor:[UIColor colorWithRed:0 green:167 blue:0 alpha:1] forState:UIControlStateNormal];
    [emailBtn setTitle:@"通过短信验证码登陆" forState:UIControlStateNormal];
    emailBtn.titleLabel.font = [UIFont systemFontOfSize:14];
    
    
    
}

- (void)cancelAction:(UIBarButtonItem *)sender
{
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    PPLoginTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PPLoginTableViewCell"];
    
    if(indexPath.row==0)
    {
        [cell layoutLeftContent:@"国家/地区" content:@"中国" andStyle:PPLoginTableViewCellDefault];
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }else if(indexPath.row == 1)
    {
        [cell layoutLeftContent:@"+86" content:@"请填写手机号码" andStyle:PPLoginTableViewCellTextField];
        
       
    }else
    {
         [cell layoutLeftContent:@"密码" content:@"请填写密码" andStyle:PPLoginTableViewCellNotLine];
    }
     cell.accessoryType = UITableViewCellAccessoryNone;
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  3;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return  self.headerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return  60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return  80;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return  self.footerView;
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
