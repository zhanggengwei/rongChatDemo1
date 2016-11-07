//
//  PPInfoMessageViewController.m
//  rongChatDemo1
//
//  Created by Donald on 16/11/7.
//  Copyright © 2016年 vd. All rights reserved.
//
NSArray * titleArr ()
{
    return @[@[@"头像",@"名字",@"微信号",@"我的二维码",@"我的地址"],@[@"性别",@"地区",@"个性签名"]];
    
}


#import "PPInfoMessageViewController.h"
#import "PPInfoMessageCell.h"
#import "PPSettingCell.h"


@interface PPInfoMessageViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView * tableView;

@end

@implementation PPInfoMessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[PPSettingCell class] forCellReuseIdentifier:@"PPSettingCell"];
    
    [self.tableView registerClass:[PPInfoMessageCell class] forCellReuseIdentifier:@"PPInfoMessageCell"];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray * arr = titleArr()[section];
    
    return arr.count;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45;
}
#pragma mark UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if(indexPath.section == 0)
    {
        if(indexPath.row == 0 || indexPath.row == 3)
        {
            PPInfoMessageCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PPInfoMessageCell"];
            return cell;
            
        }
    }
    else
    {
        PPSettingCell * cell = [tableView dequeueReusableCellWithIdentifier:@"PPSettingCell"];
        return cell;
        
        
    }
    return nil;
    
}


@end
