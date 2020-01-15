//
//  CommonViewModel.swift
//  RxMemo
//
//  Created by 박상욱 on 2020/01/15.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class CommonViewModel: NSObject {
   let title: Driver<String>
   let sceneCoordinator: SceneCoordinatorType
   let storage: MemoStorageType
   
   init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType) {
      self.title = Observable.just(title).asDriver(onErrorJustReturn: "")
      self.sceneCoordinator = sceneCoordinator
      self.storage = storage
   }
}
