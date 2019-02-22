//
//  ViewController.swift
//  7.3.1UILabel_AccessingText
//
//  Created by 王亮 on 16/7/10.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 20, y: 100, width: 280, height: 80)
        let label = UILabel(frame: rect)
        label.text = "Hello, Xcode and Swift 3!"
        
        
        let font = UIFont(name: "Arial", size: 24)
        label.font = font
        
        label.shadowColor = UIColor.lightGray
        label.shadowOffset = CGSize(width: 2, height: 2)
        
        label.textAlignment = NSTextAlignment.right
        label.textColor = UIColor.purple
        label.backgroundColor = UIColor.yellow
        
        self.view.addSubview(label)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

