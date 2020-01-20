//
//  SceneCoordinator.swift
//  RxMemo
//
//  Created by 박소정 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

extension UIViewController {
   var sceneViewController: UIViewController {
      return self.children.first ?? self
   }
}

class SceneCoordinator: SceneCoordinatorType {
   private let bag = DisposeBag()
   private var window: UIWindow
   private var currentVC: UIViewController
   
   required init(window: UIWindow) {
      self.window = window
      currentVC = window.rootViewController!
   }
   
   @discardableResult
   func transition(to scene: Scene, using style: TransitionStyle, animate: Bool) -> Completable {
      let subject = PublishSubject<Void>()
      
      let target = scene.instantiate()
      
      switch style {
      case .root:
         currentVC = target.sceneViewController
         window.rootViewController = target
         subject.onCompleted()
      case .push:
         guard let nav = currentVC.navigationController else {
            subject.onError(TransitionError.navigationControllerMissing)
            break
         }
         
         nav.rx.willShow
            .subscribe(onNext: {[unowned self] evt in
               self.currentVC = evt.viewController.sceneViewController
            })
            .disposed(by: bag)
         
         nav.pushViewController(target, animated: animate)
         currentVC = target.sceneViewController
         
         subject.onCompleted()
      case .modal:
         print("CurrentVC: ", currentVC)
         print("Target: ", target)
         currentVC.present(target, animated: animate) {
            subject.onCompleted()
         }
         currentVC = target.sceneViewController
      }
      
      return subject.ignoreElements()
   }
   
   @discardableResult
   func close(animate: Bool) -> Completable {
      return Completable.create(subscribe: { [unowned self] completable in
         if let presentingVC = self.currentVC.presentingViewController {
            self.currentVC.dismiss(animated: animate) {
               self.currentVC = presentingVC.sceneViewController
               completable(.completed)
            }
         } else if let nav = self.currentVC.navigationController {
            guard nav.popViewController(animated: animate) != nil else {
               completable(.error(TransitionError.cannotPop))
               return Disposables.create()
            }
            self.currentVC = nav.viewControllers.last!
            completable(.completed)
         } else {
            completable(.error(TransitionError.unknown))
         }
         
         return Disposables.create()
      })
   }
}
