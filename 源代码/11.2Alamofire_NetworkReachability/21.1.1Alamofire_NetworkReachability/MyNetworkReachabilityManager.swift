//
//  MyNetworkReachabilityManager.swift
//  21.1.1Alamofire_NetworkReachability
//
//  Created by 王亮 on 16/7/17.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import Alamofire

class MyNetworkReachabilityManager {
 
    
    private static let sharedInstance = MyNetworkReachabilityManager()
    var manager = NetworkReachabilityManager(host: "www.baidu.com")

    init(){
        manager?.listener = { status in
            print("Network Status Changed: \(status)")
        }
        manager?.startListening()

    }
    class var  sharedManager: MyNetworkReachabilityManager {
        
        let instance = self.sharedInstance

        return instance
    }
    
    func networkReachabilityStatus() -> Alamofire.NetworkReachabilityManager.NetworkReachabilityStatus {
        let status:Alamofire.NetworkReachabilityManager.NetworkReachabilityStatus  = (manager?.networkReachabilityStatus)!
        print("当前网络状态:\(status)")
        return status

    }
    
}
