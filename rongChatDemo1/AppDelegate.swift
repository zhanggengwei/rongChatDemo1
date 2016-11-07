//
//  AppDelegate.swift
//  rongChatDemo1
//
//  Created by vd on 2016/10/20.
//  Copyright © 2016年 vd. All rights reserved.
//

import UIKit


@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame:UIScreen.main.bounds)
        window?.backgroundColor = UIColor.white;
        
        PPChatTools.shared.initRCIM();
        let value = UserDefaults.standard.string(forKey: APPIsLogin as String);
        
        
        if (value == nil)
        {
            self.createRootLoingControlelr();
        }else
        {
            self.createTabbarController();
        }
   
        window?.makeKeyAndVisible()
        //从一个本地项目资源中读取data.Json文件
        let path: String = Bundle.main.path(forResource: "friendList", ofType: "txt")!
        let nsUrl = NSURL(fileURLWithPath: path)
        let  nsData: NSData = NSData(contentsOf: nsUrl as URL)!
        var json:Any! = nil;
        do {
            
            json = try JSONSerialization.jsonObject(with: nsData as Data, options:JSONSerialization.ReadingOptions.mutableContainers);
            
        } catch {
            
            // deal with error
        }
        print(json);
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.loginActionState), name:swiftkPPLoginSucess as NSNotification.Name, object: nil);
        
        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.loginActionState), name:swiftkPPLogOutSucess as NSNotification.Name, object: nil);
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    func createNavBarStyle()
    {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.lightContent;
        let bar:UINavigationBar = UINavigationBar.appearance();
        bar.barTintColor = UIColor.init(colorLiteralRed: 0.1, green: 0.1, blue: 0.1, alpha: 0.9);
        bar.shadowImage = UIImage.init();
        bar.tintColor = UIColor.white;
        bar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white,NSFontAttributeName:UIFont.systemFont(ofSize: 17)];
    }
    public func createTabbarController()
    {
        self.createNavBarStyle();
        /*
         控制器name数组
         */
        let  controllerArray = ["PPWeixiViewController","PPContactListViewController","PPDiscoverViewController","PPMyViewController"]
        /*
         title数组
         */
        let  titleArray = ["微信","通讯录","发现","我的"]
        /*
         默认图片数组
         */
        
        
        let  imageArray = ["tabbar_mainframe","tabbar_contacts","tabbar_discover","tabbar_me"]
        /*
         选中图片数组
         */
        let  selImageArray = ["tabbar_mainframeHL","tabbar_contactsHL","tabbar_discoverHL","tabbar_meHL"]
        /*
         tabbar高度最小值49.0, 传nil或<49.0均按49.0处理
         */
        let height = CGFloat(49)
        
        /*
         创建tabBarController
         */
        
        let tabBarController = PPTabBarController(controllerArray:controllerArray,titleArray: titleArray,imageArray: imageArray,selectImageArr: selImageArray,height:height)
        
        /**
         *  设为根控制器
         */
        window?.rootViewController = tabBarController
        
        /*
         设置数字角标(可选)
         */
        tabBarController.showBadgeMark(1, index: 1)
        
        /*
         设置小红点(可选)
         */
        tabBarController.showPointMarkIndex(2)
        
        /*
         不显示小红点/数字角标(可选)
         */
        //tabBarController.hideMarkIndex(3)
        
        /*
         手动切换tabBarController 显示到指定控制器(可选)
         */
        //tabBarController.showControllerIndex(3)
    }
    
    func createRootLoingControlelr() -> Void
    {
        self.window?.rootViewController =  UINavigationController(rootViewController:PPLoginViewController.init());
    }
    
    func loginActionState(noti:NSNotification)->Void
    {
        print("noti.name == ",noti.name);
        
        switch noti.name.rawValue
        {
        case swiftkPPLoginSucess as NSString:
            self.createTabbarController();
            UserDefaults.standard.setValue(APPIsLogin, forKey: APPIsLogin as String)
            UserDefaults.standard.synchronize()
            break;
        case swiftkPPLogOutSucess as NSString:
            self.createRootLoingControlelr();
            UserDefaults.standard.removeObject(forKey: APPIsLogin as String)
            UserDefaults.standard.synchronize()
            break;
        default:
            break;
        }
        
    }
    
    
}

