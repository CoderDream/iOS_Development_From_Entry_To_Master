//
//  PrefixHeader.swift
//  SwiftNews
//
//  Created by 王亮 on 16/8/22.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import UIKit
// 获取keyWindow
let KeyWindow : UIWindow = UIApplication.sharedApplication().keyWindow!
//获取屏幕宽度  高度
let  SCREEN_WIDTH = UIScreen.mainScreen().bounds.width
let  SCREEN_HEIGH = UIScreen.mainScreen().bounds.height
let  CURRENT_USER = "RawCurrentUser"

var  currentUser:SSDKUser?{
    set (rawCurrentUser){
        if rawCurrentUser == nil {
            CommonUtil.deleteFromUserDefaults(CURRENT_USER )
        }else{
            CommonUtil.saveToUserDefaultsWithValue(CURRENT_USER, value: rawCurrentUser!)
        }
    }
    get{
        let currentUser = CommonUtil.getValueFromUserDefaults(CURRENT_USER)
        return currentUser as? SSDKUser
    }
}




// 首先要明确一点: swift里面是没有宏定义的概念
// 自定义内容输入格式: 文件名[行号]函数名: 输入内容
// 需要在Build settings的other swift flag的Debug中添加DEBUG
func NSLog<T>(message: T, fileName: String = #file, lineNum: Int = #line, funcName: String = #function)
{
    #if DEBUG
        print("\((fileName as NSString).lastPathComponent)[\(lineNum)] \(funcName): \(message)")
    #endif
}

//MARK: keys
// Share SDK的 app key
let  APP_KEY_ShareSDK = "1684d45d78c70"
// 设置QQ的 ID，key和AuthType
let  APP_ID_QQ = "1105649514"
let  APP_KEY_QQ = "lHAgpEAYg1kWKeRh"
let  APP_AuthType_QQ = "SSDKAuthTypeSSO"
// 设置微信的 ID，密钥
let  APP_ID_WEICHAT = "wxa02b2e4bbcae1249"
let  APP_SECRET_WEICHAT = "b39ea59ad426148e17bdb4e6da2c3dd8"
//  设置talking data
let APP_KEY_TALKINGDATA = "07AB5FAAFB2EE8B61EAC31ED9A8754E8"
let APP_CHANNELID = "App Store"

//  设置leanCloud
let  APP_ID_LEANCLOUD = "JVkyvnt8jw6rds3vRs6GEnjk-gzGzoHsz"
let  APP_KEY_LEANCLOUD = "G2r5a9DtKf69KeDJrAbNXQK2"


