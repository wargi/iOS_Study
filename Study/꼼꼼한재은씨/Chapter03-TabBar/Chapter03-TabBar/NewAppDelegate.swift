//
//  NewAppDelegate.swift
//  Chapter03-TabBar
//
//  Created by 박소정 on 2018. 3. 19..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import Foundation
import UIKit

@UIApplicationMain

class NewAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
        let vcTap = UITabBarController()
        vcTap.view.backgroundColor = .white
        
        self.window?.rootViewController = vcTap
        
        let firstVC = ViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        
        vcTap.setViewControllers([firstVC, secondVC, thirdVC], animated: true)
        
        firstVC.tabBarItem = UITabBarItem(title: "Calendar", image: UIImage(named: "calendar"), selectedImage: nil)
        secondVC.tabBarItem = UITabBarItem(title: "File", image: UIImage(named: "file-tree"), selectedImage: nil)
        thirdVC.tabBarItem = UITabBarItem(title: "Photo", image: UIImage(named: "photo"), selectedImage: nil)
        
        return true
        
    }
}
