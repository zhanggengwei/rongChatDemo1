//
//  PPMyViewController.swift
//  rongChatDemo1
//
//  Created by vd on 2016/10/20.
//  Copyright © 2016年 vd. All rights reserved.
//

import UIKit

class PPMyViewController: PPBaseViewController ,UITableViewDelegate,UITableViewDataSource{
    private var tableView:UITableView?=nil;
    private var dataArray:NSArray? = nil;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.grouped)
        self.view.addSubview(self.tableView!)
        self.tableView?.delegate = self
        self.tableView?.dataSource = self
        self.tableView?.sectionFooterHeight = 0.1;
    self.tableView?.register(NSClassFromString("PPPersonTableViewCell"), forCellReuseIdentifier: "PPPersonTableViewCell")
        self.tableView?.backgroundColor = UIColor.groupTableViewBackground;
        
        self.createData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle
        {
        return UIStatusBarStyle.lightContent;
        
    }
    func createData()->Void
    {
        self.dataArray = NSArray.init();
        let model1:PPPersonal = PPPersonal.init();
        model1.leftIconName = "";
        model1.rightIconName = "setting_myQR"
        model1.content = "123";
        self.dataArray = self.dataArray?.adding(model1) as NSArray?;
        
        let model2:PPPersonal = PPPersonal.init();
        model2.leftIconName = "me_photo";
        model2.content = "相册";
        
        self.dataArray = self.dataArray?.adding(model2) as NSArray?;
        
        
        let model3:PPPersonal = PPPersonal.init();
        model3.leftIconName = "me_collect";
        model3.content = "收藏";
        
        self.dataArray = self.dataArray?.adding(model3) as NSArray?;
        
        let model4:PPPersonal = PPPersonal.init();
        model4.leftIconName = "me_collect";
        model4.content = "钱包";
        
        self.dataArray = self.dataArray?.adding(model4) as NSArray?;
        
        let model5:PPPersonal = PPPersonal.init();
        model5.leftIconName = "MoreExpressionShops";
        model5.content = "表情";
        self.dataArray = self.dataArray?.adding(model5) as NSArray?;
        
        
        let model6:PPPersonal = PPPersonal.init();
        model6.leftIconName = "me_setting";
        model6.content = "设置";
        self.dataArray = self.dataArray?.adding(model6) as NSArray?;
        self.tableView?.reloadData()
        
        
    }
    // UITableViewDataSource
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PPPersonTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PPPersonTableViewCell") as! PPPersonTableViewCell;
        var index = 0;
        var style = PPPersonTableViewCellStyle.init(0);
        
        switch indexPath.section {
        case 0:
            index = 0;
            style = PPPersonTableViewCellStyle.init(1);
            break;
        case 1:
            index = 1 + indexPath.row;
            break;
        case 2:
            index = 4 + indexPath.row;
            break;
        case 3:
            index = 5 + indexPath.row;
            break;
        case 4:
            index = 6 + indexPath.row;
        default: break
          
            
        }
        
        let model:PPPersonal = self.dataArray?.object(at: index) as! PPPersonal
        
        cell.layoutData(style, cellModel: model)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator;
        
        return cell;
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.section==0)
        {
            return 75;
        }
        return 48;
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
     
        if(indexPath.section == 3 && indexPath.row == 0)
        {
            let controller:PPSetingViewController = PPSetingViewController.init();
            controller.hidesBottomBarWhenPushed = true;
            self.navigationController?.pushViewController(controller, animated:true)
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4;
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1;
        case 1:
            return 3;
        case 2:
            return 1;
        case 3:
            return 1;
        default: break
            
        }
        return 0;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return 8;
            
        default:
            return 15;
        }
    }
  
  


}
