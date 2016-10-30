//
//  PPContactListCell.swift
//  rongChatDemo1
//
//  Created by vd on 2016/10/29.
//  Copyright © 2016年 vd. All rights reserved.
//

import UIKit


class PPContactListCell: UITableViewCell {
    private var iconImageView:UIImageView? = nil;
    private var contentLabel:UILabel? = nil;
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier);
        self.createUI();
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI() -> Void
    {
       
        self.iconImageView = UIImageView.init(frame:CGRect(x: 5, y: 5,width: self.frame.size.height - 10, height: self.frame.size.height - 10));
        self.contentView.addSubview(self.iconImageView!);
        self.contentLabel = UILabel.init(frame:CGRect(x:(self.iconImageView?.x)! + (self.iconImageView?.size.width)! + 10, y: 5,width: self.frame.size.width - 100, height: self.frame.size.height - 10));
        
        self.contentView.addSubview(self.contentLabel!);
        
        
    }

}
