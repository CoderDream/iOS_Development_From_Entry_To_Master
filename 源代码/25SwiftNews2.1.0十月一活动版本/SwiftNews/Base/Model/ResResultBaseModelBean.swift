//
//  ResResultBaseModelBean.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class ResResultBaseModelBean<N:Mappable>: Mappable {
    var stat: String?
    var data: [N]?
    
    required init?(_ map: Map){
        
    }
 
    func mapping(map: Map) {
        stat <- map["stat"]
        data <- map["data"]
    }
}