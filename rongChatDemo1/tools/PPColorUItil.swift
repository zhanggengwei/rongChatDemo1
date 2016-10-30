//
//  PPColorUItil.swift
//  rongChatDemo1
//
//  Created by vd on 2016/10/21.
//  Copyright © 2016年 vd. All rights reserved.
//

import UIKit

class PPColorUItil: NSObject
{

    public func stringFromColor(color:UIColor)->NSString
    {
        var colors:[CGFloat] = color.cgColor.components!;
        return NSString.init(format:"%02X02X02X02X", colors[0]/255.0,colors[1]/255.0,colors[2]/255.0,colors[3]/255.0) as NSString;
    }
    
    
    
}
