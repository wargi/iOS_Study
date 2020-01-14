//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by 박소정 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
   @discardableResult
   func transition(to scene: Scene, using style: TransitionStyle, animate: Bool) -> Completable
   
   @discardableResult
   func close(animate: Bool) -> Completable
}
