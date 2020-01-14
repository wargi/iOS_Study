//
//  TransitionModel.swift
//  RxMemo
//
//  Created by 박상욱 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import Foundation

enum TransitionStyle {
   case root
   case push
   case modal
}

enum TransitionError: Error {
   case navigationControllerMissing
   case cannotPop
   case unknown
}
