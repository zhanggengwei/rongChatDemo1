//
//  PPContactListViewController.swift
//  rongChatDemo1
//
//  Created by vd on 2016/10/20.
//  Copyright © 2016年 vd. All rights reserved.
//

import UIKit


class PPContactListViewController: PPBaseViewController,UITableViewDelegate,UITableViewDataSource
{
 
    private var tableView:UITableView! = nil
    private var indexArr:NSMutableArray! = nil
    private var array:NSArray = [
        "新的朋友","群聊","标签","公众号"];
    private var imageArr:NSArray = ["plugins_FriendNotify","add_friend_icon_addgroup","Contact_icon_ContactTag","add_friend_icon_offical"]
    private var contactArray:NSMutableDictionary! = nil;
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.createUI();
        self.indexArr = NSMutableArray.init();
        self.indexArr.add("发现");
        self.tableView.sectionIndexBackgroundColor = UIColor.clear;
        self.tableView.sectionIndexColor = UIColor.gray;
        
       // self.tableView.sectionIndexMinimumDisplayRowCount = 6;
        let rightItem:UIBarButtonItem = UIBarButtonItem.init(image: UIImage.init(named: "contacts_add_friend"), style: UIBarButtonItemStyle.plain, target: self, action: #selector(PPContactListViewController.addFriend));
        self.navigationItem.rightBarButtonItem = rightItem;
        self.contactArray = NSMutableDictionary.init();
        
    
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createUI() -> Void
    {
        self.tableView = UITableView.init(frame: self.view.bounds,style:UITableViewStyle.grouped);
      self.tableView.register(PPContactListCell.classForCoder(), forCellReuseIdentifier: "PPContactListCell")
        self.tableView.backgroundColor = UIColor.white
        self.view.addSubview(self.tableView)
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    func addFriend() -> Void {
        let controller:PPAddFriendViewController = PPAddFriendViewController.init();
        controller.hidesBottomBarWhenPushed = true;
        self.navigationController?.pushViewController(controller, animated: true);
    }
    
    func createData() -> Void
    {
        
    }
    

    // 
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let  cell:PPContactListCell = tableView.dequeueReusableCell(withIdentifier: "PPContactListCell")! as! PPContactListCell;
        if(indexPath.section==0)
        {
            //- (void)setLeftIconImageNamed:(NSString *)imageName andRightContentLabel:(NSString *)content
            let  imageName:String = imageArr.object(at: indexPath.row) as! String;
            
            let content:String = array.object(at: indexPath.row) as! String
            
            cell.setLeftIconImageNamed(imageName as String!, andRightContentLabel:content as String!)
            
        }
        return cell;
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section==0)
        {
            return 4;
        }
        return self.contactArray.count;
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1 + self.contactArray.count;
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return [UITableViewIndexSearch,"1","2"];
        
    }
    
    
    
    
    

}
