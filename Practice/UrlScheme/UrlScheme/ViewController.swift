//
//  ViewController.swift
//  UrlScheme
//
//  Created by 박소정 on 2018. 3. 16..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        openSetting()
//        openFacebook()
//        openSms()
        openMyApp()
        
    }

    func openSetting() {
        guard let settingURL = URL(string: UIApplicationOpenSettingsURLString), UIApplication.shared.canOpenURL(settingURL) else { return }
        if #available(iOS 10.9, *) {
            UIApplication.shared.open(settingURL)
        } else {
            UIApplication.shared.openURL(settingURL)
        }
    }
    
    private func openSms() {
        let smsScheme = URL(string: "http://maps.apple.com/ll?120,56")!
        if UIApplication.shared.canOpenURL(smsScheme) {
            UIApplication.shared.open(smsScheme)
        }
        print(UIApplication.shared.canOpenURL(smsScheme))
    }
    
    private func openFacebook() {
        let facebookScheme = URL(string: "http://google.com")!
        if UIApplication.shared.canOpenURL(facebookScheme) {
            UIApplication.shared.open(facebookScheme)
        }
        print(UIApplication.shared.canOpenURL(facebookScheme))
    }
    
    private func openMyApp() {
        let myApp = URL(string: "myApp://name=abc&age=10")!
        if UIApplication.shared.canOpenURL(myApp) {
            UIApplication.shared.open(myApp)
        }
        print(UIApplication.shared.canOpenURL(myApp))
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

