//
//  PPAddFriendViewController.m
//  rongChatDemo1
//
//  Created by vd on 2016/11/2.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "PPAddFriendViewController.h"

@interface PPAddFriendViewController ()

@end

@implementation PPAddFriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"添加朋友";
    self.view.backgroundColor = [UIColor whiteColor];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
