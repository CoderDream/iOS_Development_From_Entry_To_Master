//
//  CommonUtil.swift
//  SwiftNews
//
//  Created by 王亮 on 16/9/2.
//  Copyright © 2016年 www.coolketang.com. All rights reserved.
//

import Foundation

class CommonUtil {
    
    private static let SwiftNewsBundleShortVersionString = "SwiftNewsBundleShortVersionString"
    // MARK: - 判断版本号
    internal static func hasNewFeature() -> Bool
    {
        // 根据版本号来确定是否进入新特性界面
        let currentVersion = NSBundle.mainBundle().infoDictionary!["CFBundleShortVersionString"] as! String
        let oldVersion = NSUserDefaults.standardUserDefaults().objectForKey(SwiftNewsBundleShortVersionString) ?? ""
        
        // 如果当前的版本号和本地保存的版本比较是降序, 则需要显示新特性
        if (currentVersion.compare(oldVersion as! String)) == .OrderedDescending{
            // 保存当前的版本
            NSUserDefaults.standardUserDefaults().setObject(currentVersion, forKey: SwiftNewsBundleShortVersionString)
            return true
        }
        return false
    }

    
    internal static func saveToUserDefaultsWithValue(key:String, value:AnyObject)->Void{
        let userDefault = NSUserDefaults.standardUserDefaults()
        
        //实例对象转换成NSData
        let modelData:NSData = NSKeyedArchiver.archivedDataWithRootObject(value)
        
        userDefault .setObject(modelData, forKey: key)
        userDefault.synchronize()
    }
 
    
    internal static func getValueFromUserDefaults(key:String ) -> AnyObject?{
    
        let userDefault = NSUserDefaults.standardUserDefaults()
        let  objData:AnyObject? =  userDefault.objectForKey(key)
        if objData == nil {
            return nil
        }
        let  targetObj:AnyObject? = NSKeyedUnarchiver.unarchiveObjectWithData(objData as! NSData)
        return targetObj
        
    }
    
    internal static func deleteFromUserDefaults(key:String ) -> Void{
        let userDefault = NSUserDefaults.standardUserDefaults()
            userDefault.removeObjectForKey(key)
            userDefault.synchronize()
    }
}
