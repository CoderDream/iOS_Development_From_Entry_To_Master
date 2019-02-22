//
//  ViewController.swift
//  7.3.2UILabel_SizingText3
//
//  Created by 王亮 on 16/9/17.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var labSizing: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let text = "This is new Swift 3 ! This is new Swift 3 ! This is new Swift 3 ! This is new Swift 3 ! This is new Swift 3 ! This is new Swift 3 ! This is new Swift 3 !This is new Swift 3 !This is new Swift 3 !This is new Swift 3 !This is new Swift 3 !This is new Swift 3 !This is new Swift 3 !"
        
        let rect = ViewController.getTextRectSize(text: text as NSString, font: UIFont .systemFont(ofSize: 17), size: CGSize(width:200,height:1000))
        self.labSizing.text = text
        self.labSizing.frame = CGRect(x:self.labSizing.frame.origin.x,y:self.labSizing.frame.origin.y,width:rect.size.width,height:rect.size.height)
        
    }


    /**
     *  获取字符串的宽度和高度
     *
     *  @param text:NSString
     *  @param font:UIFont
     *
     *  @return CGRect
     */
    class func getTextRectSize(text:NSString,font:UIFont,size:CGSize) -> CGRect {
        let attributes = [NSFontAttributeName: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        print("rect:\(rect)");
        return rect;
    }
}

