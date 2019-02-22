//
//  LoginModel.swift
//  27.3MVC
//
//  Created by 王亮 on 16/8/19.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit

class LoginModel: NSObject {
    private static let sharedInstance = LoginModel()
 
     class var  sharedManager: LoginModel {
        
        let instance = self.sharedInstance
        
        return instance
    }
    
    public func loginWithAccount(name:String ,pwd:String) -> Bool {
        if (name == "test" && pwd == "123456") {
            return true;
        }else{
            return false;
        }

    }
 
}
