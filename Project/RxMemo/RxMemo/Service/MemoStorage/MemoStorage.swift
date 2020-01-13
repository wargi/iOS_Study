//
//  MemoStorage.swift
//  RxMemo
//
//  Created by 박소정 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import Foundation
import RxSwift

protocol MemoStorageType {
   @discardableResult
   func createMemo(content: String) -> Observable<Memo>
   
   @discardableResult
   func memoList() -> Observable<[Memo]>
   
   @discardableResult
   func update(memo: Memo, content: String) -> Observable<Memo>
   
   @discardableResult
   func delete(memo: Memo) -> Observable<Memo>
}
