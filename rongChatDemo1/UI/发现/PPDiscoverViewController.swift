//
//  PPDiscoverViewController.swift
//  rongChatDemo1
//
//  Created by vd on 2016/11/3.
//  Copyright © 2016年 vd. All rights reserved.
//

import UIKit

class PPDiscoverViewController: PPBaseViewController,UITableViewDelegate,UITableViewDataSource {
    private var tableView:UITableView! = nil
    let array:NSArray = [["朋友圈"],["扫一扫","摇一摇"],["附近的人"],["购物","游戏"]];
    let imageArray:NSArray = [["ff_IconShowAlbum"],["ff_IconQRCode","ff_IconShake"],["ff_IconLocationService"],["CreditCard_ShoppingBag","MoreGame"]]
    // private var tableView:UITableView! = nil
    private var indexArr:NSMutableArray! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.grouped);
        self.view.addSubview(self.tableView);
    self.tableView.register(PPContactListCell.classForCoder(), forCellReuseIdentifier: "PPContactListCell");
        self.tableView.sectionFooterHeight = 0.1;
        
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  cell:PPContactListCell = tableView .dequeueReusableCell(withIdentifier: "PPContactListCell") as! PPContactListCell;
        let array:NSArray = self.array[indexPath.section] as! NSArray;
        let content:String = array.object(at: indexPath.row) as! String;
        
        let imageArray:NSArray = self.imageArray[indexPath.section] as! NSArray;
        let imageName:String = imageArray.object(at: indexPath.row) as! String;
        
        cell.setLeftIconImageNamed(imageName, andRightContentLabel:content as String!);
        
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.array.count;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array:NSArray = self.array[section] as! NSArray;
        return array.count;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if(section==0)
        {
            return 10;
        }
        return 15;
    }
    
    
    
    
    
    
    
}
