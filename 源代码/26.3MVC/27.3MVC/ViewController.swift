//
//  ViewController.swift
//  27.3MVC
//
//  Created by 王亮 on 16/8/19.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class ViewController: UIViewController,LoginViewDelegate {

    @IBOutlet weak var vLogin: LoginView!

    func login() -> Bool {
      return  LoginModel.sharedManager .loginWithAccount(name: self.vLogin.txtfName.text!, pwd: self.vLogin.txtfPwd.text!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.vLogin.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

