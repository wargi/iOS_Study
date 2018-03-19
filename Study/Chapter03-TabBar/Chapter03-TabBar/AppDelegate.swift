//
//  AppDelegate.swift
//  Chapter03-TabBar
//
//  Created by 박소정 on 2018. 3. 19..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //1. 루트 뷰 컨트롤러를 UITabBarController로 캐스팅
        if let tbC = self.window?.rootViewController as? UITabBarController {
            //Tabbar아이템 배열을 불러온다.
            if let tbItems = tbC.tabBar.items {
                //각각의 아이템에 이미지와 타이틀을 입력
//                tbItems[0].image = UIImage(named: "calendar.png")
//                tbItems[1].image = UIImage(named: "file-tree")
//                tbItems[2].image = UIImage(named: "photo")
                
                tbItems[0].image = UIImage(named: "designbump")?.withRenderingMode(.alwaysOriginal)
                tbItems[1].image = UIImage(named: "rss")?.withRenderingMode(.alwaysOriginal)
                tbItems[2].image = UIImage(named: "facebook")?.withRenderingMode(.alwaysOriginal)
                
                for tbItem in tbItems {
                    let img = UIImage(named: "checkmark")?.withRenderingMode(.alwaysOriginal)
                    tbItem.selectedImage = img
                }
                
                tbItems[0].title = "Calendar"
                tbItems[1].title = "File"
                tbItems[2].title = "Photo"
                
            }
            // 탭 바의 선택시 변경 될 이미지 색상 결정
//            tbC.tabBar.tintColor = .white
            // 탭 바의 백그라운드 이미지 설정
//            tbC.tabBar.backgroundImage = UIImage(named: "menubar-bg-mini")
            
            // 다른 방법
//            let image = UIImage(named: "menubar-bg-mini")!
//            tbC.tabBar.barTintColor = UIColor(patternImage: image)
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

