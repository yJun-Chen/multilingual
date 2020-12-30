//
//  ViewController.swift
//  multilingual
//
//  Created by 陈永军 on 2020/12/28.
//

import Cocoa

class ViewController: NSViewController {
    
    
    @IBOutlet weak var viewText: NSTextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(changeLanguages), name:NSNotification.Name(rawValue: "changeLanguage"), object: nil)
        setView()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    
    func setView(){
        viewText.stringValue = SettingInfo.valueOf("Test text")
    }
    
    
    @objc func changeLanguages(){
        if let view = self as? ViewController{
            view.setView()
        }
    }
}

