//
//  PPDiscoverViewController.swift
//  PPSwiftRongChat
//
//  Created by Donald on 16/10/22.
//  Copyright © 2016年 Susu. All rights reserved.
//

import UIKit

open class  PPDiscoverViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    private let tableView:UITableView;
    override open func viewDidLoad() {
    
        //viewDidLoad()
        self.view.backgroundColor = UIColor.yellow;
      
        // Do any additional setup after loading the view.
    }

    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    class func createViewController()->UIViewController
    {
       return UIStoryboard.init(name: "PPTDiscover", bundle: nil).instantiateViewController(withIdentifier: "PPSwiftRongChat.PPDiscoverViewController");
    
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    public class  func createPPDiscoverViewController()->UIViewController
    {
        return UIStoryboard.init(name:"PPTDiscover", bundle: nil).instantiateViewController(withIdentifier: NSStringFromClass(self))
        
    }
    
 //MARK  
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PPTDiscoverListCell");
        return cell!;
    }
     public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
     public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44;
        
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 3;
        
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 3;
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
