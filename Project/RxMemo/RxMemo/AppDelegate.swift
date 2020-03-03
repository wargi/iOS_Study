//
//  AppDelegate.swift
//  RxMemo
//
//  Created by 박소정 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

   var window: UIWindow?

   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      // Override point for customization after application launch.
      
      let storage = CoreDataStorage(modelName: "RxMemo")
      let coordinator = SceneCoordinator(window: window!)
      let listViewModel = MemoListViewModel(title: "나의 메모", sceneCoordinator: coordinator, storage: storage)
      let listScene = Scene.list(listViewModel)
      
      coordinator.transition(to: listScene, using: .root, animate: false)
      
      return true
   }
}

