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
       
        return cell;
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3;
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return [UITableViewIndexSearch,"1","2"];
        
    }
    
    
    

}
