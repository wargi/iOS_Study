//
//  StructType.swift
//  Serialization
//
//  Created by giftbot on 2018. 1. 21..
//  Copyright © 2018년 Giftbot. All rights reserved.
//

import Foundation

struct StructType: CustomStringConvertible {
  let name: String
  let job: String
  
  init(name: String, job: String) {
    self.name = name
    self.job = job
  }
  
  var description: String {
    return name + " : " + job
  }
}
