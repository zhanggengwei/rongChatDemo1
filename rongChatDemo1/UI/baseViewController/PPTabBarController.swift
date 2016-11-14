//
//  PPTabBarController.swift
//  PPTabBarController
//
//  Created by vd on 2016/10/22.
//  Copyright © 2016年 vd. All rights reserved.
//

import UIKit

func ColorRgba(red:CGFloat,green:CGFloat,blue:CGFloat,alpha:CGFloat) -> UIColor
{
    return UIColor.init(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: alpha);
}
func ColorRbg(red:CGFloat,green:CGFloat,blue:CGFloat) -> UIColor {
    return ColorRgba(red: red, green: green, blue: blue, alpha: 1);
}
func ColorRandom() -> UIColor {
    return ColorRgba(red: CGFloat(arc4random()%255), green: CGFloat(arc4random()%255), blue: CGFloat(arc4random()%255), alpha: 1);
}
private let SCREEN_WIDTH = UIScreen.main.bounds.size.width
private let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
private let TabBarColor = UIColor.white

private let TabBarTitleColor = UIColor.gray
private let ColorTitleSel = ColorRbg(red:0,green: 167,blue: 0)
// ColorRbg(41,g: 167,b: 245)
//字体的大小

private let TabBarTitleFontSize:CGFloat = 12.0
//numMarkD  数字角标的直径

private let TabBarNumberMarkD:CGFloat = 20
//小圆点的直径的值
private let TabBarPointMarkD:CGFloat = 12

//图片与文字上下占比
private let scale:CGFloat = 0.55

extension PPTabBarController
{
    public  func showControllerIndex(_ index:Int) -> Void
    {
        
        guard index < controllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        self.seleBtn!.isSelected = false
        let button = (customBar.viewWithTag(1000+index) as? UIButton)!
        button.isSelected = true
        self.seleBtn = button
        self.selectedIndex = index
        
    }
    /**
     *  设置数字角标
     *
     *  - param: num   所要显示数字
     *  - param: index 位置
     */
    public func showBadgeMark(_ badge: Int, index: Int) {
        
        guard index < controllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        
        let numLabel = (customBar.viewWithTag(1020+index) as? UILabel)!
        numLabel.isHidden = false
        var nFrame = numLabel.frame
        if badge <= 0 {
            //隐藏角标
            self.hideMarkIndex(index)
            
        } else {
            
            if badge > 0 && badge <= 9 {
                
                nFrame.size.width = TabBarNumberMarkD
                
            } else if badge > 9 && badge <= 19 {
                
                nFrame.size.width = TabBarNumberMarkD+5
                
            } else {
                
                nFrame.size.width = TabBarNumberMarkD+10
                
            }
            nFrame.size.height = TabBarNumberMarkD
            numLabel.frame = nFrame
            numLabel.layer.cornerRadius = TabBarNumberMarkD/2.0
            numLabel.text = "\(badge)"
            if badge > 99 {
                numLabel.text = "99+"
            }
            
        }
    }
    
    /**
     *  设置小红点
     *
     *  - param: index 位置
     */
    public func showPointMarkIndex(_ index: Int) {
        guard index < controllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        let numLabel = (customBar.viewWithTag(1020+index) as? UILabel)!
        numLabel.isHidden = false
        var nFrame = numLabel.frame
        nFrame.size.height = TabBarPointMarkD
        nFrame.size.width = TabBarPointMarkD
        numLabel.frame = nFrame
        numLabel.layer.cornerRadius = TabBarPointMarkD/2.0
        numLabel.text = ""
    }
    
    /**
     *  影藏指定位置角标
     *
     *  - param: index 位置
     */
    public func hideMarkIndex(_ index: Int) {
        guard index < controllerArray.count else
        {
            print("error:index="+"\(index)"+"超出范围")
            return;
        }
        let numLabel = (customBar.viewWithTag(1020+index) as? UILabel)!
        numLabel.isHidden = true
    }
}

class PPTabBarButton: UIButton {
    
    
    override var isHighlighted: Bool
        {
        didSet{
            super.isHighlighted = false
        }
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        titleLabel?.textAlignment = NSTextAlignment.center
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect
    {
        //return  {(CGPoint){0,0},(CGSize){0,0}};
        
        let newX:CGFloat = 0.0
        let newY:CGFloat = 5.0
        let newWidth:CGFloat = contentRect.size.width
        let newHeight:CGFloat = contentRect.size.height * scale - newY
        return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect
    {
        let newX: CGFloat = 0
        let newY: CGFloat = contentRect.size.height*scale
        let newWidth: CGFloat = contentRect.size.width
        let newHeight: CGFloat = contentRect.size.height-contentRect.size.height*scale
        return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
    }
    
}




public class PPTabBarController: UITabBarController {
    var seleBtn: UIButton?
    var tabBarHeight:CGFloat = 49.0
    var titleArray = [String]()
    var imageArray = [String]()
    var selImageArray = [String]()
    var controllerArray = [String]()
    
    
    override open func viewDidLoad()
    {
        super.viewDidLoad()
        addController()
        self.tabBar.addSubview(customBar)
        addTabBarButton()
        setupTabbarLine()
        
        
        // Do any additional setup after loading the view.
    }
    override open func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    init(array:NSArray)
    {
        
        super.init();
        
    }
   public init(controllerArray:[String],titleArray:[String],imageArray:[String],selectImageArr:[String],height:CGFloat?)
    {
        self.titleArray = titleArray;
        self.imageArray = imageArray;
        self.selImageArray = selectImageArr;
        self.controllerArray = controllerArray;
        if let tempHeight = height
        {
            tabBarHeight = tempHeight;
        }
        if tabBarHeight < 49.0
        {
            tabBarHeight = 49.0
        }
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //懒加载
    
    fileprivate lazy var customBar:UIView
        = {
            let x = CGFloat(0)
            let y = 49.0 - self.tabBarHeight
            let width = SCREEN_WIDTH
            let height = self.tabBarHeight
            
            let view = UIView(frame:CGRect(x: x,y: y,width: width,height: height))
            view.backgroundColor = TabBarColor
            
            return view
            
    }()
    
    /**
     *  移除系统创建的UITabBarButton
     */
    fileprivate func removeTabBarButton()
    {
        for view in tabBar.subviews {
            if view.isKind(of: NSClassFromString("UITabBarButton")!) {
                view.removeFromSuperview()
            }
        }
    }
    fileprivate  func addController() -> Void
    {
        guard controllerArray.count > 0 else
        {
            print("error:控制器数组为nil")
            return
        }
        var navArray = [UIViewController]()
        //获取命名的空间
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        //   for (index, className) in controllerArray.enumerated() {
        for(index,className) in controllerArray.enumerated()
        {
            
            let cls: AnyClass? = NSClassFromString(ns + "." + className)
            //Swift中如果想通过一个Class来创建一个对象, 必须告诉系统这个Class的确切类型
            guard let vcCls = cls as? UIViewController.Type else
            {
                print("error:cls不能当做UIViewController")
                return
            }
            let vc = vcCls.init()
            vc.title = titleArray[index]
            let nav = UINavigationController(rootViewController:vc)
            navArray.append(nav)
            
        }
        viewControllers  = navArray;
    }
    
    /**
     添加tabbarButton
     */
    fileprivate func addTabBarButton()
    {
        
        let num = controllerArray.count
        for i in 0..<num {
            
            let  width = SCREEN_WIDTH
            let  x = CGFloat(width/CGFloat(num)*CGFloat(i))
            let  y:CGFloat = 0.0
            let  w = width/CGFloat(num)
            let  h = tabBarHeight
            let  button = PPTabBarButton(frame:CGRect(x: x,y: y,width: w,height: h))
            
            button.tag = 1000+i
            button.setTitleColor(TabBarTitleColor, for: UIControlState())
            button.setTitleColor(ColorTitleSel, for: UIControlState.selected)
            button.titleLabel?.font = UIFont.systemFont(ofSize: TabBarTitleFontSize)
            button.setImage(UIImage.init(named:self.imageArray[i]), for: UIControlState())
            button.setImage(UIImage.init(named: self.selImageArray[i]), for: UIControlState.selected)
            button.setTitle(self.titleArray[i], for: UIControlState())
            button.addTarget(self, action:#selector(buttonClickAction(btn:)), for: .touchDown)
            
            customBar.addSubview(button)
            
            //默认选中
            if i == 0 {
                
                button.isSelected = true
                self.seleBtn = button
            }
            
            //角标
            let numLabel = UILabel(frame: CGRect(x: button.frame.size.width/2.0+6, y: 3, width: TabBarPointMarkD, height: TabBarPointMarkD))
            numLabel.layer.masksToBounds = true
            numLabel.layer.cornerRadius = 10
            numLabel.backgroundColor = UIColor.red
            numLabel.textColor = UIColor.white
            numLabel.textAlignment = NSTextAlignment.center
            numLabel.font = UIFont.systemFont(ofSize: 13)
            numLabel.tag = 1020+i
            numLabel.isHidden = true
            button.addSubview(numLabel)
        }
    }
    @objc fileprivate func buttonClickAction(btn:UIButton) -> Void
    {
        let index: Int = btn.tag-1000
        self.showControllerIndex(index)
    }
    
    /**
     处理高度>49 tabbar顶部线
     */
    fileprivate func setupTabbarLine()
    {
        guard tabBarHeight > 49 else
        {
            return;
        }
        self.tabBar.shadowImage = UIImage.init()
        self.tabBar.backgroundImage = UIImage.init()
        let line = UILabel(frame: CGRect(x: 0, y: 0,width: SCREEN_WIDTH, height: 0.5))
        line.backgroundColor = UIColor.lightGray
        customBar.addSubview(line)
    }
    
    
    
    
}
