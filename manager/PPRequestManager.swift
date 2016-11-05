//
//  PPRequestManager.swift
//  rongChatDemo1
//
//  Created by vd on 2016/10/30.
//  Copyright © 2016年 vd. All rights reserved.
//

import UIKit

//线上正式环境
//#define DemoServer @"http://api.hitalk.im/" //测试环境
typealias successRequest = (_ dict:NSDictionary?)->Void
typealias failedRequset =  (_ dict:NSDictionary?)->Void
let demoServer:String  = "http://api.sealtalk.im/";
let ContentType:String = "application/json";
let demoLoginUrl = "user/login"

class PPRequestManager: NSObject
{
    
    let manager:AFHTTPRequestOperationManager? = nil;
    

    class var shareManager:PPRequestManager
    {
        let instance:PPRequestManager = Inner.instance;
    
        return instance;
    }
    struct Inner {
        static let instance = PPRequestManager()
    }
    

    
    //
   public func requestGetUserToken(phone:String,passWord:String,region:String,sucess:successRequest,fail:failedRequset) -> Void
    {
        /*
         NSDictionary *params = @{
         @"region" : region,
         @"phone" : phone,
         @"password" : password
         };
         */
        let parms:NSMutableDictionary = NSMutableDictionary();
        parms.setValue(phone, forKey: "phone")
        parms.setValue(passWord, forKey: "password")
        parms.setValue(region, forKey: "region")
        
        let requestManager:AFHTTPRequestOperationManager = AFHTTPRequestOperationManager.init(baseURL: NSURL.init(string: demoServer) as URL!);
     
        
        requestManager.post(demoLoginUrl, parameters: parms, success: { (opearion, object) in
            print(opearion);
            print(object);
            
            
            }) { (operation, error) in
                print(error);
    
        };

        
        
        
        
    }
    
    
}
