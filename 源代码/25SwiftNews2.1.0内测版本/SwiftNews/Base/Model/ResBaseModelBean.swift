//
//  ResBaseModelBean.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import Foundation
import ObjectMapper
import AlamofireObjectMapper

class ResBaseModelBean: Mappable {
    var reason: String?

    required init?(_ map: Map){
        
    }

    func mapping(map: Map) {
        reason <- map["reason"]
    }
}

