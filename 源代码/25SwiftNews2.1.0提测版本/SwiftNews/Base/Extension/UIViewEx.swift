//
//  UIViewEx.swift
//  SwiftNews
//
//  Created by 王亮 on 16/9/1.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import Foundation

@IBDesignable
extension UIView {
    
    /**
     *  圆角半径
     */
    @IBInspectable var cornerRadius: CGFloat {
        get{
            return layer.cornerRadius
        }
        set (newCornerRadius){
            layer.cornerRadius = newCornerRadius
            layer.masksToBounds = true
        }
    }
    /**
     *  边界线颜色
     */
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor.init(CGColor: layer.borderColor! )
        }
        set (newBorderColor){
            layer.borderColor = newBorderColor.CGColor
        }
    }
    /**
     *  边界线宽度
     */
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set (newBorderWidth){
            layer.borderWidth = newBorderWidth
        }
    }
}