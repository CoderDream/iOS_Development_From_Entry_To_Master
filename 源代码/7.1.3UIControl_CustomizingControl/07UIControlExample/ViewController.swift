//
//  ViewController.swift
//  07UIControlExample
//
//  Created by 王亮 on 16/6/7.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

     var customControl: CustomControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.customControl = CustomControl(frame:CGRect(x: 100,y: 100,width: 100,height: 100))
        self.customControl.backgroundColor = UIColor.red
        self.customControl .addTarget(self, action: #selector(touchUpInside(_: )), for: UIControlEvents.touchUpInside)
        self.view .addSubview(self.customControl)

         
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func touchUpInside(_ sender:AnyObject){
        print("touchUpInside ... ")
    }
    
}

