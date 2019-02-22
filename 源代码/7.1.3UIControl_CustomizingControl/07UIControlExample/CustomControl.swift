//
//  CustomControl.swift
//  07UIControlExample
//
//  Created by 王亮 on 16/6/7.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class CustomControl: UIControl {
 
    override func sendAction(_ action: Selector, to target: Any?, for event: UIEvent?) {
       super.sendAction(action, to: target, for: event)
    }
    
    
 }
