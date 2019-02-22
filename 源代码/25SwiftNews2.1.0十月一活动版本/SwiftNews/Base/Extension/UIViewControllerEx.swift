
//
//  UIViewControllerEx.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/31.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import Foundation
extension UIViewController {
    
    public static func  instantiateViewController(storyboardName:String) -> UIViewController {
        
        let storyboard = UIStoryboard.init(name: storyboardName, bundle: nil)
        let className = String(self)
        let aVC = storyboard.instantiateViewControllerWithIdentifier(className)
        return aVC;
    }
    
}