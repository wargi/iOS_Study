//
//  Memo.swift
//  RxMemo
//
//  Created by 박소정 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import Foundation

struct Memo: Equatable {
   var content: String
   var insertDate: Date
   var identity: String
   
   init(content: String, insertDate: Date = Date()) {
      self.content = content
      self.insertDate = insertDate
      self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
   }
   
   init(original: Memo, updateContent: String) {
      self = original
      self.content = updateContent
   }
}
