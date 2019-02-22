//
//  ResNewsListModelBean.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import ObjectMapper
import AlamofireObjectMapper

class ResNewsListModelBean<N:Mappable>:ResBaseModelBean {
   var result: ResResultBaseModelBean<N>?
    required init?(_ map: Map){
        super.init(map)
    }
    
    override func mapping(map: Map) {
        result <- map["result"]
    }
}
