//
//  DetailVC.swift
//  OneMoreSearch0107
//
//  Created by 劉坤昶 on 2016/1/7.
//  Copyright © 2016年 劉坤昶 Johnny. All rights reserved.
//

import UIKit

class DetailVC: UIViewController {
    
    var newArray:Candy?
    
    var detailName = UILabel()
    var detailImage = UIImageView()
    

    override func viewDidLoad()
    {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.whiteColor()

        detailName.frame = CGRectMake(0, 0, 150, 50)
        detailName.textAlignment = .Center
        detailName.center = CGPointMake(self.view.frame.size.width/2, 100)
        detailName.font = UIFont.boldSystemFontOfSize(30)
        detailName.text = newArray!.name
        self.view.addSubview(detailName)
        
        detailImage.frame = CGRectMake(0, 0, 200, 200)
        detailImage.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)
        detailImage.contentMode = .ScaleAspectFill
        detailImage.clipsToBounds = true
        detailImage.image = UIImage(named: (newArray?.name)!)
        self.view.addSubview(detailImage)
        
        self.title = newArray?.name
    
    
    
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
