//
//  ViewController.swift
//  7.6.2UITextField_ManagingOverlay
//
//  Created by 王亮 on 16/7/11.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 10, y: 80, width: 300, height: 40)
        let textField = UITextField(frame: rect)
        
        textField.placeholder = "Bank card no"
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        textField.keyboardType = UIKeyboardType.numberPad
        textField.keyboardAppearance = UIKeyboardAppearance.dark
        textField.delegate = self
        
        textField.borderStyle = UITextBorderStyle.line
        
        
//        textField.clearButtonMode = .whileEditing
        
        let btnLeft:UIButton = UIButton(type: UIButtonType.custom)
        btnLeft.frame = CGRect(x:0,y:0,width: 30,height: 30)
        
        btnLeft.setBackgroundImage(UIImage(named: "银行信息"), for: UIControlState())
        textField.leftView = btnLeft
        textField.leftViewMode = .unlessEditing
        
        let btnRight:UIButton = UIButton(type: UIButtonType.custom)
        btnRight.frame = CGRect(x:0,y:0,width: 30,height: 30)
        textField.rightViewMode = .always
        textField.addTarget(self, action: #selector(touchupInsideBtnAction(_:)), for: UIControlEvents.touchUpInside)
        btnRight.setBackgroundImage(UIImage(named: "相机"), for: UIControlState())
        textField.rightView = btnRight
        self.view.addSubview(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func touchupInsideBtnAction(_ btn:UIButton)
    {
        let message = "模拟拍照扫描银行卡."
     
        let alert = UIAlertController(title: "Information", message: message, preferredStyle: UIAlertControllerStyle.alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil)
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

