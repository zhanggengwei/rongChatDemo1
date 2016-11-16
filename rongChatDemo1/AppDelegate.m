//
//  AppDelegate.m
//  rongChatDemo1
//
//  Created by vd on 2016/11/14.
//  Copyright © 2016年 vd. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
   
    [[PPChatTools shareManager] initRCIM];
    
    id value = [[NSUserDefaults standardUserDefaults]objectForKey:OBJC_APPIsLogin];
   
    
    

    
    return YES;
}

/**
 * 推送处理2
 */
//注册用户通知设置
- (void)application:(UIApplication *)application
didRegisterUserNotificationSettings:
(UIUserNotificationSettings *)notificationSettings {
    // register to receive notifications
    [application registerForRemoteNotifications];
}

/**
 * 推送处理3
 */
- (void)application:(UIApplication *)application
didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
    NSString *token =
    [[[[deviceToken description] stringByReplacingOccurrencesOfString:@"<"
                                                           withString:@""]
      stringByReplacingOccurrencesOfString:@">"
      withString:@""]
     stringByReplacingOccurrencesOfString:@" "
     withString:@""];
    
    [[RCIMClient sharedRCIMClient] setDeviceToken:token];
}

- (void)application:(UIApplication *)application
didFailToRegisterForRemoteNotificationsWithError:(NSError *)error {
#if TARGET_IPHONE_SIMULATOR
    // 模拟器不能使用远程推送
#else
    // 请检查App的APNs的权限设置，更多内容可以参考文档
    // http://www.rongcloud.cn/docs/ios_push.html。
    NSLog(@"获取DeviceToken失败！！！");
    NSLog(@"ERROR：%@", error);
#endif
}

- (void)onlineConfigCallBack:(NSNotification *)note {
    
    NSLog(@"online config has fininshed and note = %@", note.userInfo);
}

/**
 * 推送处理4
 * userInfo内容请参考官网文档
 */
- (void)application:(UIApplication *)application
didReceiveRemoteNotification:(NSDictionary *)userInfo
{
  
}

- (void)application:(UIApplication *)application
didReceiveLocalNotification:(UILocalNotification *)notification {
  
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state.
    // This can occur for certain types of temporary interruptions (such as an
    // incoming phone call or SMS message) or when the user quits the application
    // and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down
    // OpenGL ES frame rates. Games should use this method to pause the game.
    int unreadMsgCount = [[RCIMClient sharedRCIMClient] getUnreadCount:@[
                                                                         @(ConversationType_PRIVATE),
                                                                         @(ConversationType_DISCUSSION),
                                                                         @(ConversationType_APPSERVICE),
                                                                         @(ConversationType_PUBLICSERVICE),
                                                                         @(ConversationType_GROUP)
                                                                         ]];
    application.applicationIconBadgeNumber = unreadMsgCount;
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
 
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the
    // application was inactive. If the application was previously in the
    // background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if
    // appropriate. See also applicationDidEnterBackground:.
}
- (void) createNavBarStyle
{
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    
  
    UINavigationBar * bar = [UINavigationBar appearance];
    
    bar.barTintColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.1 alpha:0.9];
  
    bar.shadowImage = [UIImage new];
    
    bar.tintColor = [UIColor whiteColor];
    bar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:[UIFont systemFontOfSize:17]};
    
    
    
}
-(void)createTabbarController
{
    [self createNavBarStyle];
    /*
     控制器name数组
     */
    NSArray *  controllerArray = @[@"PPWeixiViewController",@"PPContactListViewController",@"PPDiscoverViewController",@"PPMyViewController"];
    
    /*
     title数组
     */
    NSArray *  titleArray = @[@"微信",@"通讯录",@"发现",@"我的"];
    
    /*
     默认图片数组
     */
    
    
    NSArray *  imageArray = @[@"tabbar_mainframe",@"tabbar_contacts",@"tabbar_discover",@"tabbar_me"];
    
    /*
     选中图片数组
     */
    NSArray *  selImageArray = @[@"tabbar_mainframeHL",@"tabbar_contactsHL",@"tabbar_discoverHL",@"tabbar_meHL"];
    
    /*
     tabbar高度最小值49.0, 传nil或<49.0均按49.0处理
     */
    CGFloat height = 49;
    
    /*
     创建tabBarController
     */
    PPTabBarController * tabBarController = [[PPTabBarController alloc]init];
   
    [PPTabBarController alloc]init
    
    
    
    
    
    
    
    PPTab
 
    
    PPTabBarController * tabBarController = [[PPTabBarController alloc]init]
    
    
    PPTabBarController(controllerArray:controllerArray,titleArray: titleArray,imageArray: imageArray,selectImageArr: selImageArray,height:height)
    
    /**
     *  设为根控制器
     */
    window?.rootViewController = tabBarController
    
    /*
     设置数字角标(可选)
     */
    tabBarController.showBadgeMark(1, index: 1);
    
    /*
     设置小红点(可选)
     */
    tabBarController.showPointMarkIndex(2);
    
    /*
     不显示小红点/数字角标(可选)
     */
    //tabBarController.hideMarkIndex(3)
    
    /*
     手动切换tabBarController 显示到指定控制器(可选)
     */
    //tabBarController.showControllerIndex(3)
}
@end
