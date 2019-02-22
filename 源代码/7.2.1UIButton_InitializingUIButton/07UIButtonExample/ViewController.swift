//
//  ViewController.swift
//  07UIButtonExample
//
//  Created by 王亮 on 16/7/3.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btnTest: UIButton!
    var btn1Test: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.btnTest .setTitle("计算器", for: UIControlState.highlighted)
//        self.btnTest.setBackgroundImage(UIImage.init(named: "AGShareBG"), for: UIControlState.norm)
//        self.btnTest.setBackgroundImage(UIImage.init(named: "AGShareBG"), for: UIControlState.highlighted)
//        
//        self.btnTest.setTitleColor(UIColor.black(),for: UIControlState.Normal) //普通状态下文字的颜色
//        self.btnTest.setTitleShadowColor(UIColor.green(),for:.Normal) //普通状态下文字阴影的颜色
//        self.btnTest.setBackgroundImage(UIImage(named:"AGShareBG"),for:.Normal)   //设置按钮背景图片
        
        self.btnTest.adjustsImageWhenHighlighted = true
        
        
       self.printSubviews(view: self.btnTest)
        
       self.btn1Test = UIButton.init(type: UIButtonType.custom)
       self.btn1Test?.setTitle("我是btn1", for: UIControlState.highlighted)
       self.btn1Test?.frame = CGRect(x: 10, y: 10, width: 50, height: 40)
       self.btn1Test?.backgroundColor = UIColor.red
       self.view .addSubview(self.btn1Test!)
        
        
        
    }
    
    func printSubviews(view:UIView)  {
        
        print("view object : \(view)")
        
        for var subview in view.subviews {
            print("view object : \(subview)")
            self.printSubviews(view: subview)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func touchUpInsideTestBtnAction(_ sender: UIButton) {
        print("touchUpInsideTestBtnAction")
    }
    

    @IBAction func touchUpInsidetestbtnAnothorAction(_ sender: UIButton) {
        print("touchUpInsidetestbtnAnthorAction")
    }

}

