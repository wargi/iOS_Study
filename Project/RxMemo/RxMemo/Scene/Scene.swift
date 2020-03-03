//
//  Scene.swift
//  RxMemo
//
//  Created by 박상욱 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import Foundation
import UIKit

enum Scene {
   case list(MemoListViewModel)
   case detail(MemoDetailViewModel)
   case compose(MemoComposeViewModel)
}

extension Scene {
   func instantiate(from storyboard: String = "Main") -> UIViewController {
      let storyboard = UIStoryboard(name: storyboard, bundle: nil)
      
      switch self {
      case .list(let viewModel):
         guard let nav = storyboard.instantiateViewController(withIdentifier: "listNav") as? UINavigationController else {
            fatalError()
         }
         
         guard var listVC = nav.viewControllers.first as? MemoListViewController else {
            fatalError()
         }
         
         listVC.bind(viewModel: viewModel)
         return nav
      case .detail(let viewModel):
         guard var detailVC = storyboard.instantiateViewController(withIdentifier: "DetailVC") as? MemoDetailViewController else {
            fatalError()
         }
         
         detailVC.bind(viewModel: viewModel)
         return detailVC
      case .compose(let viewModel):
         guard let composeNav = storyboard.instantiateViewController(withIdentifier: "ComposeNav") as? UINavigationController else {
            print("WOW")
            fatalError()
         }
         
         guard var composeVC = composeNav.viewControllers.first as? MemoComposeViewController else {
            print("Error")
            fatalError()
         }
         
         composeVC.bind(viewModel: viewModel)
         return composeNav
      }
   }
}
