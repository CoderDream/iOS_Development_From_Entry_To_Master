//
//  TabBarController.swift
//  SwiftNews
//
//  Created by 王亮 on 16/9/2.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import SnapKit

class TabBarController: UITabBarController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 修改文字的颜色
        UITabBarItem.appearance().setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.brownColor()], forState: UIControlState.Normal)
 
    }
 
}
