//
//  UITableViewEx.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/31.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import Foundation

extension UITableView {

    public func registerNibClassName(aClass:AnyClass) -> Void {
        let  className = String(aClass)
        let  nib = UINib.init(nibName: className, bundle: NSBundle.mainBundle())
        self.registerNib(nib, forCellReuseIdentifier: className)
    }
    
}