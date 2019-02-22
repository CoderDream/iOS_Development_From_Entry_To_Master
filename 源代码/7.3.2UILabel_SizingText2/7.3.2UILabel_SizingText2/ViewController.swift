//
//  ViewController.swift
//  7.3.2UILabel_SizingText2
//
//  Created by 王亮 on 16/7/10.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 10, y: 100, width: 300, height: 100)
        let label = UILabel(frame: rect)
        label.text = "Love you、think of you.love you secretly,love you eagerly,wait ,feel disappointed,try hard,lose,and feel sad,go apart,and recall.these are for sake of you.And I will regret for it."
        
        label.backgroundColor = UIColor.brownColor()
        label.textColor = UIColor.purpleColor()
        label.textAlignment = .Center
        
        label.lineBreakMode = .ByTruncatingMiddle
        label.numberOfLines = 0
        
        label.allowsDefaultTighteningForTruncation = true
        
        self.view.addSubview(label)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

