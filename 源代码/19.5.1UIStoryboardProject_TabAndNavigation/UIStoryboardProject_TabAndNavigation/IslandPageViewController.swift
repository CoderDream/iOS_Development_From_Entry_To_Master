//
//  IslandPageViewController.swift
//  UIStoryboardProject_TabAndNavigation
//
//  Created by Jerry on 16/6/2.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.

import UIKit

class IslandPageViewController: UIViewController {

    @IBOutlet var labelMessage: UILabel!
    var message = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        labelMessage.text = message
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
