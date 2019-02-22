//
//  ViewController.swift
//  7.4.2UISwitch_CustomizingSwitch
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
        
        uiSwitch.thumbTintColor = UIColor.blue
        uiSwitch.onTintColor = UIColor.green
        uiSwitch.tintColor = UIColor.brown
        
        uiSwitch.addTarget(self, action: #selector(ViewController.switchChanged(_:)), for: UIControlEvents.valueChanged)
        
        self.view.addSubview(uiSwitch)
    }
    
    func switchChanged(_ uiSwitch:UISwitch)
    {
        var message = "Turn on the switch."
        if(!uiSwitch.isOn)
        {
            message = "Turn off the switch."
        }
        let alert = UIAlertController(title: "Information", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }


}

