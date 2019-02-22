//
//  JuHeAPI.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import Foundation
import Moya

// MARK: - Provider setup
let JuHeProvider = MoyaProvider<JuHe>()


/**
 
  MARK: 创建JuHe 请求
 - GetNewsListByType  根据类型获取新闻列表
 */
public enum JuHe {
    case GetNewsListByType(String) //根据类型获取新闻列表
}


extension JuHe : TargetType {
    // 聚合API地址
    public var baseURL: NSURL { return NSURL(string: "https://v.juhe.cn/")! }
    
    /// 拼接请求字符串
    public var path: String {
        switch self {
        case .GetNewsListByType:
            return ("toutiao/index")
        }
    }
    /// 请求方法
    public var method: Moya.Method {
        return .POST
    }
    
    /// 配置参数
    public var parameters: [String: AnyObject]? {
        switch self {
        case .GetNewsListByType(let type):
              return ["type": type, "key": "e5ed6b5b55675ab54f8d86d098289761"]
          
        }
    }
    
    /// 数据
    public var sampleData: NSData {
        switch self {
        case .GetNewsListByType:
            return "Half measures are as bad as nothing at all.".dataUsingEncoding(NSUTF8StringEncoding)!
        }
    }
    
    public var multipartBody: [MultipartFormData]? {
        return nil
    }
    
}
