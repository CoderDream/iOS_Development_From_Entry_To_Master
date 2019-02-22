//
//  ViewController.swift
//  21.3Alamofire_Get&PostRequest
//
//  Created by 王亮 on 16/7/20.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    @IBAction func touchupInsideGetRequestBtnAction(_ sender: AnyObject) {
        
        Alamofire.request( "https://httpbin.org/get",method:.get, parameters: ["foo": "bar"])
            .responseJSON { response in
                print("original URL request: \(response.request)")  // original URL request
                print("URL response: \(response.response)") // URL response
                print("server data: \(response.data)")     // server data
                print("result of response serialization: \(response.result)")   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }
        }
        
    }


    @IBAction func touchupInsidePostRequestBtnAction(_ sender: AnyObject) {
        let parameters = [
            "foo": "bar",
            "baz": ["a", 1],
            "qux": [
                "x": 1,
                "y": 2,
                "z": 3
            ]
        ] as [String : Any]
        Alamofire.request("https://httpbin.org/post",method:.post, parameters: parameters)
            .responseJSON { response in
                print("original URL request: \(response.request)")  // original URL request
                print("URL response: \(response.response)") // URL response
                print("server data: \(response.data)")     // server data
                print("result of response serialization: \(response.result)")   // result of response serialization
                
                if let JSON = response.result.value {
                    print("JSON: \(JSON)")
                }

        }
        
    }
}

