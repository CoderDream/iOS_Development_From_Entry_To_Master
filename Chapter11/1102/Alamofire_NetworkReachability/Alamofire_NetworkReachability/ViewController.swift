//
//  ViewController.swift
//  Alamofire_NetworkReachability
//
//  Created by CoderDream on 2019/2/22.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func clickCheckBtn(_ sender: UIButton) {
        var message = "当前无网络"
        let status : NetworkReachabilityManager.NetworkReachabilityStatus = MyNetworkReachabilityManager.sharedManager.networkReachabilityStatus()
        switch status {
        case .notReachable:
            message = "当前无网络"
            print("\(message)")
            break
            
        case .reachable(NetworkReachabilityManager.ConnectionType.ethernetOrWiFi):
            message = "当前为WIFI网络"
            print("\(message)")
            break
        case .reachable(NetworkReachabilityManager.ConnectionType.wwan):
            message = "是3G或4G网络"
            print("\(message)")
            break
        default:
            message = "当前无网络"
            print("\(message)")
            break
        }
        
        let alert = UIAlertController(title: "Information", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
}

