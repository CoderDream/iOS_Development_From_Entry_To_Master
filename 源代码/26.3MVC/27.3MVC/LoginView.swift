//
//  LoginView.swift
//  27.3MVC
//
//  Created by 王亮 on 16/8/19.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
protocol LoginViewDelegate {
     func login() -> Bool
}
class LoginView: UIView {

    
    @IBOutlet weak var txtfName: UITextField!
    @IBOutlet weak var txtfPwd: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    var delegate:LoginViewDelegate?
    
    
    @IBAction func touchupInsideBtnLogin(_ sender: AnyObject) {
        let result = self.delegate?.login()
        print("result:\(result)")
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
