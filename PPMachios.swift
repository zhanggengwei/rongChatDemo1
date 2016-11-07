//
//  PPMachios.swift
//  rongChatDemo1
//
//  Created by vd on 2016/11/5.
//  Copyright © 2016年 vd. All rights reserved.
//

import Foundation
let swiftkPPLoginName:NSString  = "kPPObserverLoginSucess";


class PPMachios:NSObject
{
    public class var AppKey: String {
        // 这里返回一个 Int 值
        return "";
    }
   public class var SCREEN_SIZE:CGSize
        {
        return UIScreen.main.bounds.size;
    }
   public class var SCREEN_WIDTH:CGFloat
        {
        return self.SCREEN_SIZE.width;
    }
   public class var SCREEN_HEIGHT:CGFloat
        {
        return self.SCREEN_SIZE.height;
        
    }
}
