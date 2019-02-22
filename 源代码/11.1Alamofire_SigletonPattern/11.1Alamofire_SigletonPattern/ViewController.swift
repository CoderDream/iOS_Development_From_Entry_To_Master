//
//  ViewController.swift
//  11.1Alamofire_SigletonPattern
//
//  Created by 王亮 on 16/7/23.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private  let sharedInstance = ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        sharedInstance = ViewController()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

