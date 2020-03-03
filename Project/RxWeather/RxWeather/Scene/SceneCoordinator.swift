//
//  Copyright (c) 2019 KxCoding <kky0317@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
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
   func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
      let subject = PublishSubject<Void>()
      
      let target = scene.instantiate()
      
      switch style {
      case .root:
         currentVC = target.sceneViewController
         window.rootViewController = target
         subject.onCompleted()
      case .push:
         print(currentVC)
         guard let nav = currentVC.navigationController else {
            subject.onError(TransitionError.navigationControllerMissing)
            break
         }
         
         nav.rx.willShow
            .subscribe(onNext: { [unowned self] evt in
               self.currentVC = evt.viewController.sceneViewController
            })
            .disposed(by: bag)
         
         nav.pushViewController(target, animated: animated)
         currentVC = target.sceneViewController
         
         subject.onCompleted()
      case .modal:
         currentVC.present(target, animated: animated) {
            subject.onCompleted()
         }
         currentVC = target.sceneViewController
      }
      
      return subject.ignoreElements()
   }
   
   @discardableResult
   func close(animated: Bool) -> Completable {
      return Completable.create { [unowned self] completable in
         if let presentingVC = self.currentVC.presentingViewController {
            self.currentVC.dismiss(animated: animated) {
               self.currentVC = presentingVC.sceneViewController
               completable(.completed)
            }
         } else if let nav = self.currentVC.navigationController {
            guard nav.popViewController(animated: animated) != nil else {
               completable(.error(TransitionError.cannotPop))
               return Disposables.create()
            }
            self.currentVC = nav.viewControllers.last!
            completable(.completed)
         } else {
            completable(.error(TransitionError.unknown))
         }
         
         return Disposables.create()
      }
   }
}
