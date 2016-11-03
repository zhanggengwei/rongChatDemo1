//
//  PPAddFriendViewController.m
//  rongChatDemo1
//
//  Created by vd on 2016/11/2.
//  Copyright © 2016年 vd. All rights reserved.
//

NSArray * AddressBookTableTitles() {
    return @[@"新的朋友",
             @"群聊",
             @"标签",
             @"公众号"];
};

#import "PPAddFriendViewController.h"

@interface PPAddFriendViewController ()
@property (nonatomic,strong) UISearchController * searchController;
@property (nonatomic,strong) UITableView * tableView;
@end

@implementation PPAddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加朋友";
    self.view.backgroundColor = [UIColor whiteColor];
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    [self initSearchController];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.tabBarController.tabBar.hidden = YES;
    
}
- (void)initSearchController{
   
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
   // self.searchController.searchResultsUpdater = self;
    //self.searchController.dimsBackgroundDuringPresentation = NO;
    //self.searchController.hidesNavigationBarDuringPresentation = NO;
    self.searchController.searchBar.frame = CGRectMake(self.searchController.searchBar.frame.origin.x,self.searchController.searchBar.frame.origin.y,self.searchController.searchBar.frame.size.width,44);
    self.searchController.searchBar.backgroundColor = [UIColor whiteColor];
    
    self.tableView.tableHeaderView = self.searchController.searchBar;
    self.searchController.dimsBackgroundDuringPresentation = NO;
    self.tableView.backgroundColor = [UIColor whiteColor];
    //self.searchController.searchBar.delegate = self;
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
