//
//  ViewController.swift
//  21.1.1Alamofire_NetworkReachability
//
//  Created by 王亮 on 16/7/17.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//


import UIKit
import Alamofire

class ViewController: UIViewController {
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func touchupInsideCheckBtnAction(_ sender: UIButton) {
        var message = "当前无网络"
        let status: NetworkReachabilityManager.NetworkReachabilityStatus =  MyNetworkReachabilityManager.sharedManager.networkReachabilityStatus()
        
        switch status {
        case .notReachable:
            message = "当前无网络"
            print("当前无网络")
            break
        case .reachable(NetworkReachabilityManager.ConnectionType.ethernetOrWiFi):
            message = "是WIFI网络"
            print("是WIFI网络")
            break
        case .reachable(NetworkReachabilityManager.ConnectionType.wwan):
            message = "是3G或4G网络"
            print("是3G或4G网络")
            break

        default:
            message = "当前无网络"
             break
        }
        
        
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

