//
//  SwitchLanguageUtil.swift
//  multilingual
//
//  Created by 陈永军 on 2020/12/28.
//

import Foundation

class SwitchLanguageUtil:NSObject{
    static var bundle:Bundle? = nil
    static let LocalLanguageKey:String = "\(Bundle.main.infoDictionary!["CFBundleIdentifier"] as! String).SwitchLanguageService";
    
    static func getCurrentLanguage() -> String{
        let def = UserDefaults.standard
        var currentLanguage = def.value(forKey: LocalLanguageKey) as? String
        if (currentLanguage == nil){
            let language = NSLocale.preferredLanguages
            currentLanguage = language[0]
            
            if (currentLanguage!.hasPrefix("en")){
                currentLanguage = "en"
            }else if(currentLanguage!.hasPrefix("ja")){
                currentLanguage = "ja"
            }else if(currentLanguage!.hasPrefix("es")){
                currentLanguage = "es"
            }else if(currentLanguage!.hasPrefix("zh")){
                currentLanguage = "zh-Hans"
            }else{
                currentLanguage = "English"
            }
        }
        return currentLanguage ?? "English"
    }
    
    static func initUserLanguage(){
        let def = UserDefaults.standard
        var currentLanguage = def.value(forKey: LocalLanguageKey) as? String
        if (currentLanguage == nil){
            let language = NSLocale.preferredLanguages
            currentLanguage = language[0]
            if (currentLanguage!.hasPrefix("en")){
                currentLanguage = "en"
            }else if(currentLanguage!.hasPrefix("ja")){
                currentLanguage = "ja"
            }else if(currentLanguage!.hasPrefix("es")){
                currentLanguage = "es"
            }else if(currentLanguage!.hasPrefix("zh")){
                currentLanguage = "zh-Hans"
            }else{
                currentLanguage = "en"
            }
            def.setValue(currentLanguage, forKey: LocalLanguageKey)
            def.synchronize()
        }
        let path = Bundle.main.path(forResource: currentLanguage, ofType: "lproj")
        bundle = Bundle.init(path: path!)
    }
    
    static func setUserLanguage(language:String) {
        let userDefaults = UserDefaults.standard
        let currentLanguage = userDefaults.value(forKey: LocalLanguageKey) as? NSString
        if (currentLanguage != nil && currentLanguage!.isEqual(to: language)){
            return
        }
        userDefaults.setValue(language, forKey: LocalLanguageKey)
        userDefaults.synchronize()
        let path = Bundle.main.path(forResource: language, ofType: "lproj")
        bundle = Bundle.init(path: path!)
    }
    
    static func getLocalString(str:String) -> String{
        if (SwitchLanguageUtil.bundle == nil){
            SwitchLanguageUtil.initUserLanguage()
        }
        return SwitchLanguageUtil.bundle?.localizedString(forKey:str, value: nil, table: "InfoPlist") ?? str
    }
    
    static func changeLanguage(language:String){
        setUserLanguage(language: language)
        NotificationCenter.default.post(name: Notification.Name.init("changeLanguage"), object: self)
        
    }
}
