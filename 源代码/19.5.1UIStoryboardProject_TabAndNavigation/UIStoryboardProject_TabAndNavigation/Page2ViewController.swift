//
//  Page3ViewController.swift
//  DemoApp
//
//  Created by Jerry on 15/10/15.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class Page2ViewController: UIViewController {
    var name = ""
    @IBOutlet var labelName: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelName.text = name
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
