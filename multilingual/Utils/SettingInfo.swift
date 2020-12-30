//
//  SettingInfo.swift
//  multilingual
//
//  Created by 陈永军 on 2020/12/28.
//

import Foundation
import Cocoa

class SettingInfo{
    
    static var AllStrring : Dictionary<String,String>{
        var res:Dictionary<String,String> = [:]
        
        for (key,value) in NSDictionary.init(contentsOfFile: Bundle.main.path(forResource: "Setting", ofType: "plist")!)!{
            res[key as! String] = value as? String
        }
        return res
    }
    
    static func valueOf(_ key:String) -> String{
        return SwitchLanguageUtil.getLocalString(str: SettingInfo.AllStrring[key] ?? key)
    }
}
