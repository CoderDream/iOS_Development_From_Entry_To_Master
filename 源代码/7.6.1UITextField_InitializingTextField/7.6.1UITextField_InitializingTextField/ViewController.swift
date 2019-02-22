//
//  ViewController.swift
//  7.6.1UITextField_InitializingTextField
//
//  Created by 王亮 on 16/7/11.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let rect = CGRect(x: 60, y: 80, width: 200, height: 30)
        let textField = UITextField(frame: rect)
        
//        textField.borderStyle = UITextBorderStyle.roundedRect
        textField.placeholder = "Your Email"
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextFieldViewMode.whileEditing
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.keyboardAppearance = UIKeyboardAppearance.dark
        textField.delegate = self
        
        self.view.addSubview(textField)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

