//
//  ViewController.swift
//  ProjTarget-Action1
//
//  Created by 王亮 on 16/6/5.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btn: UIButton!
    
    @IBOutlet weak var btn1: UIButton!
    
    @IBOutlet weak var btn2: UIButton!
    
    @IBAction func touchupInsideBtnAction(_ sender: AnyObject, forEvent event: UIEvent) {
        
        print("按下的按钮是 Button")
        btn.sendAction(#selector(ViewController.helloWorld), to: self, for: nil)
//        self.helloWorld()
    }
    
    func helloWorld(){
        print("helloWorld")
    }

    @IBAction func touchUpInsideBtn1Action(_ sender: AnyObject) {

        print("按下的按钮是 Button1")
        btn .sendActions(for: .touchUpInside)

        
    }
    
    
    func touchupInsideBtn2Action(_ sender:AnyObject, forEvent event:UIEvent){
        print("按下的按钮是 Button2")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        //是否启用
        self.btn.isEnabled = true
        //是否高亮
        self.btn1.isHighlighted = true
        //纵向对齐方式
        self.btn2.contentVerticalAlignment = .top
        //横向对齐方式
        self.btn2.contentHorizontalAlignment = .center
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    


}

