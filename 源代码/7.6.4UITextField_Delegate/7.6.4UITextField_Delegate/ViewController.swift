//
//  ViewController.swift
//  7.6.4UITextField_Delegate
//
//  Created by 王亮 on 16/7/12.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate{

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
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool // return NO to disallow editing.
    {
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) // became first responder
    {
        
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    {
        
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        // return NO to not change text
        return true
    }
    
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return true
    }


}

