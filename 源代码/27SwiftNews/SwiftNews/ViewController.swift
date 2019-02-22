//
//  ViewController.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/19.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//
//import PrefixHeader.swift
import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        fetchNewsListData()
        
//        
//        let URL = "https://v.juhe.cn/toutiao/index?type=top&key=e5ed6b5b55675ab54f8d86d098289761"
//        
//        Alamofire.request(.GET, URL).responseObject { (response: Response<ResNewsListModelBean, NSError>) in
//            
//            let baseModelBean = response.result.value
//            print(baseModelBean?.reason)
//            
//            if let result = baseModelBean?.result {
//                for item in result.data! {
//                    print("title:"+item.title!)
//                    print("author:"+item.author_name!)
//                }
//            }
//        }
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /**
     新闻接口请求数据
     */
    func fetchNewsListData() {
        
        JuHeProvider.request(JuHe.GetNewsListByType("top")) {(result) -> () in
            print("result: \(result)")
            
            switch result {
            case let .Success(response):
                do {
                    
                    let baseModelBean = Mapper<ResNewsListModelBean<ResResultDataBaseModelBean>>().map(try response.mapJSON())
                    print("baseModelBean: \(baseModelBean?.reason)")
                    
                    if let result = baseModelBean?.result {
                        for item in result.data! {
                            print("title:"+item.title!)
                            print("author:"+item.author_name!)
                        }
                    }

                } catch {
                    
                }
                
            case let .Failure(error):
                guard let error = error as? CustomStringConvertible else {
                    break
                }
            
            }

        }

    }

}

