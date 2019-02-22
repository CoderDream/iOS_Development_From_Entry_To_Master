//
//  MyNetworkReachabilityManager.swift
//  Alamofire_NetworkReachability
//
//  Created by CoderDream on 2019/2/22.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import Alamofire

class MyNetworkReachabilityManager {
    private static let sharedInstance = MyNetworkReachabilityManager()
    var manager = NetworkReachabilityManager(host: "www.baidu.com")  // N(host: "www.baidu.com")
    
    init() {
        manager?.listener = { status in
            print("Network Status Changed: \(status)")
        }
        manager?.startListening()
    }
    
    class var sharedManager : MyNetworkReachabilityManager {
        let instance = self.sharedInstance
        
        return instance
    }
}
