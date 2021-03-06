//
//  AppDelegate.swift
//  multilingual
//
//  Created by 陈永军 on 2020/12/28.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    

    @IBOutlet weak var changeLanguageItem: NSMenuItem!
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        changeLanguageState()
        
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    var languageItem:NSMenuItem? = nil

    @IBAction func changeLanguageAction(_ sender: Any) {
        if let pub = sender as? NSMenuItem {
            if (languageItem != nil){
                languageItem?.state = NSControl.StateValue.off
            }
            languageItem = pub
            switch pub.title{
                case "简体中文":
                        SwitchLanguageUtil.changeLanguage(language: "zh-Hans")
                case "日语":
                    SwitchLanguageUtil.changeLanguage(language: "ja")
                case "English":
                    SwitchLanguageUtil.changeLanguage(language: "en")
                default:
                    break;
            }
            pub.state = NSControl.StateValue.on
        }
    }
    
    func changeLanguageState(){
        let currentLanguage = SwitchLanguageUtil.getCurrentLanguage
        print("更改当前语言:\(currentLanguage)")
        let menu = NSApplication.shared.mainMenu?.items[1]
        switch currentLanguage {
        case "zh-Hans":
            menu?.submenu?.items[0].state = NSControl.StateValue.on
        case "ja":
            menu?.submenu?.items[1].state = NSControl.StateValue.on
        case "en":
            menu?.submenu?.items[2].state = NSControl.StateValue.on
        default:
            break;
        }
    }
    
    

}

