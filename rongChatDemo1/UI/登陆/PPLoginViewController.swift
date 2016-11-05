//
//  PPLoginViewController.swift
//  rongChatDemo1
//
//  Created by vd on 2016/10/21.
//  Copyright © 2016年 vd. All rights reserved.
//

import UIKit

class PPLoginViewController: PPBaseViewController,UITableViewDelegate,UITableViewDataSource {

    private var item:UIBarButtonItem! = nil;
    private var tableView:UITableView! = nil;
    private var headerView:UILabel! = nil;
    private var footerView:UIView! = nil;
    override func viewDidLoad() {
        super.viewDidLoad()
        self.item = UIBarButtonItem.init(title: "取消", style: UIBarButtonItemStyle.done, target: self, action: #selector(PPLoginViewController.cancelAction));
        self.navigationItem.leftBarButtonItem = self.item;
        self.item.tintColor = ColorRbg(red:0,green: 167,blue: 0);
        self.createLoginNavBarStryle()
        


        self.createUI();
        self.tableView.register(PPLoginTableViewCell.classForCoder(), forCellReuseIdentifier: "PPLoginTableViewCell")
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createLoginNavBarStryle() -> Void
    {
        UIApplication.shared.statusBarStyle = UIStatusBarStyle.default;
        let bar:UINavigationBar = UINavigationBar.appearance();
        bar.barTintColor = UIColor.white;
        bar.shadowImage = UIImage.init();
        for view:UIView in bar.subviews {
            if(view.isKind(of: UIImageView.classForCoder()))
            {
                if(view.frame.size.height<=1)
                {
                    view.removeFromSuperview()
                }
            }
        }
        self.navigationController?.navigationBar.clipsToBounds = true;
        

        
    }
    func cancelAction() -> Void {
        
    }
    func createUI() -> Void {
        self.headerView = UILabel.init(frame:CGRect(x:0,y:0,width:PPMachios.SCREEN_WIDTH,height:0));
        self.headerView.font = UIFont.systemFont(ofSize: 18)
        self.headerView.text = "使用手机号码登陆";
        self.headerView.textAlignment = NSTextAlignment.center;
        
        self.tableView = UITableView.init(frame: self.view.bounds, style: UITableViewStyle.plain)
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PPLoginTableViewCell = tableView.dequeueReusableCell(withIdentifier: "PPLoginTableViewCell") as! PPLoginTableViewCell;
        return cell;
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44;
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.headerView;
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil;
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
    
        return 0;
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0;
        
    }
    
    
 

}
class LoginView :UIView
{
    
    override init(frame: CGRect) {
        super.init(frame:frame);
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


class PPLoginTableViewCell:UITableViewCell
{
    private let leftLabel:UILabel! = nil;
    private let textField:UITextField! = nil;
    private let leftLabelTextField:UITextField! = nil;
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func creatUI()->Void
    {
        
    }
}


