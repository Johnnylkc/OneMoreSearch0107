//
//  MainCell.swift
//  OneMoreSearch0107
//
//  Created by 劉坤昶 on 2016/1/7.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit

class MainCell: UITableViewCell {
    
    var candyName = UILabel()

    var candyType = UILabel()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?)
    {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
      
        candyName.frame = CGRectMake(20, 0, 150, 30)
        contentView.addSubview(candyName)

        
        
        candyType.frame = CGRectMake(20,  20, 150, 30)
        contentView.addSubview(candyType)
        
        
       
        
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }

    
    
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
