//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by 박상욱 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import Foundation
import RxSwift

class MemoryStorage: MemoStorageType {
   private var list = [
      Memo(content: "Hello, RxSwift", insertDate: Date().addingTimeInterval(-10)),
      Memo(content: "Lorem, Ipsum", insertDate: Date().addingTimeInterval(-20))
   ]
   
   private lazy var sectionModel = MemoSectionModel(model: 0, items: list)
   
   private lazy var store = BehaviorSubject<[MemoSectionModel]>(value: [sectionModel])
   
   @discardableResult
   func createMemo(content: String) -> Observable<Memo> {
      let memo = Memo(content: content)
      list.insert(memo, at: 0)
      
      store.onNext([sectionModel])
      
      return Observable.just(memo)
   }
   
   @discardableResult
   func memoList() -> Observable<[MemoSectionModel]> {
      return store
   }
   
   @discardableResult
   func update(memo: Memo, content: String) -> Observable<Memo> {
      let update = Memo(original: memo, updateContent: content)
      
      if let index = sectionModel.items.firstIndex(where: { $0 == memo }) {
         sectionModel.items.remove(at: index)
         sectionModel.items.insert(update, at: index)
      }
      
      store.onNext([sectionModel])
      
      return Observable.just(update)
   }
   
   @discardableResult
   func delete(memo: Memo) -> Observable<Memo> {
      if let index = sectionModel.items.firstIndex(where: { $0 == memo }) {
         sectionModel.items.remove(at: index)
      }
      
      store.onNext([sectionModel])
      
      return Observable.just(memo)
   }
}
