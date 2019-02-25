//
//  ViewController.swift
//  Alamofire_GetPostRequest
//
//  Created by CoderDream on 2019/2/25.
//  Copyright © 2019 CoderDream. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func clickGetRequestBtn(_ sender: UIButton) {
        Alamofire.request("https://httpbin.org/get", method: .get, parameters: ["foo":"bar"]).responseJSON { response in
            print("original URL request: \(String(describing: response.request))")
            print("URL response: \(String(describing: response.response))")
            print("server data: \(String(describing: response.data))")
            print("timeline data: \(String(describing: response.timeline))")
            print("result of response serialization: \(response.result)")
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
        
    }
    @IBAction func clickPostRequestBtn(_ sender: UIButton) {
        let parameters = [
            "foo" : "bar",
            "baz" : ["a", 1],
            "qux" : [
                "x" : 1,
                "y" : 2,
                "z" : 3
            ]
        ] as [String : Any]
        
        Alamofire.request("https://httpbin.org/post", method: .post, parameters: parameters).responseJSON { response in
            print("original URL request: \(String(describing: response.request))")
            print("URL response: \(String(describing: response.response))")
            print("server data: \(String(describing: response.data))")
            print("timeline data: \(String(describing: response.timeline))")
            print("result of response serialization: \(response.result)")
            
            if let JSON = response.result.value {
                print("JSON: \(JSON)")
            }
        }
    }
}

