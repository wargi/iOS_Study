//
//  MemoListViewModel.swift
//  RxMemo
//
//  Created by 박상욱 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Action

class MemoListViewModel: CommonViewModel {
   var memoList: Observable<[Memo]> {
      return storage.memoList()
   }
   
   lazy var detailAction: Action<Memo, Void> = {
      return Action { memo in
         let detailViewModel = MemoDetailViewModel(memo: memo, title: "메모 보기", sceneCoordinator: self.sceneCoordinator, storage: self.storage)
         
         let detailScene = Scene.detail(detailViewModel)
         
         return self.sceneCoordinator.transition(to: detailScene, using: .push, animate: true).asObservable().map { _ in }
      }
   }()
}
