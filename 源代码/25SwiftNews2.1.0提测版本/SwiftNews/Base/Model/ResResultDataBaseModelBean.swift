//
//  ResResultDataBaseModelBean.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//
import LeanCloud
import Foundation
import ObjectMapper
import AlamofireObjectMapper

/*
 "title": "巫山云雨枉断肠：女摄影师Erika Lust记录的性爱",/*标题*/
 "date": "2016-06-13 10:31",/*时间*/
 "author_name": "POCO摄影",/*作者*/
 "thumbnail_pic_s": "http://09.imgmini.eastday.com/mobile/20160613/20160613103108_7b015493398e7fd13dda3a5c
 e315b1c8_1_mwpm_03200403.jpeg",/*图片1*/
 "thumbnail_pic_s02": "http://09.imgmini.eastday.com/mobile/20160613/20160613103108_7b015493398e7fd13dda3a5ce315
 b1c8_1_mwpl_05500201.jpeg",/*图片2*/
 "thumbnail_pic_s03": "http://09.imgmini.eastday.com/mobile/20160613/20160613103108_7b015493398e7fd13dda3a5ce315
 b1c8_1_mwpl_05500201.jpeg",/*图片3*/
 "url": "http://mini.eastday.com/mobile/160613103108379.html?qid=juheshuju",/*新闻链接*/
 "uniquekey": "160613103108379",/*唯一标识*/
 "type": "头条",/*类型一*/
 "realtype": "娱乐"/*类型二*/
 */

class ResResultDataBaseModelBean: Mappable {
    var title: String?
    var date: String?
    var author_name: String?
    var thumbnail_pic_s: String?
    var thumbnail_pic_s02: String?
    var thumbnail_pic_s03: String?
    var url: String?
    var uniquekey: String?
    var type: String?
    var realtype: String?
 
    init(){
        
    }
    
    required init?(_ map: Map){
        
    }
   
    
    func mapping(map: Map) {
        title <- map["title"]
        date <- map["date"]
        author_name <- map["author_name"]
        thumbnail_pic_s <- map["thumbnail_pic_s"]
        thumbnail_pic_s02 <- map["thumbnail_pic_s02"]
        thumbnail_pic_s03 <- map["thumbnail_pic_s03"]
        url <- map["url"]
        uniquekey <- map["uniquekey"]
        type <- map["type"]
        realtype <- map["realtype"]
        
    }
}
 