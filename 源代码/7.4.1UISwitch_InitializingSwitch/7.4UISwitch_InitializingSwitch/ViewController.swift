//
//  ViewController.swift
//  7.4UISwitch_InitializingSwitch
//
//  Created by 王亮 on 16/7/10.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let rect = CGRect(x: 130, y: 100, width: 0, height: 0)
        let uiSwitch = UISwitch(frame: rect)
        uiSwitch.setOn(true, animated: true)
        print("UISwitch frame:\(uiSwitch.frame)")
        
        self.view.addSubview(uiSwitch)

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

