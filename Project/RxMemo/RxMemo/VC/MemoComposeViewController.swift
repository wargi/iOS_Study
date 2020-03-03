//
//  MemoComposeViewController.swift
//  RxMemo
//
//  Created by 박상욱 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import NSObject_Rx
import Action

class MemoComposeViewController: UIViewController, ViewModelBindableType {
   
   var viewModel: MemoComposeViewModel!
   
   @IBOutlet private weak var contentTextView: UITextView!
   @IBOutlet private weak var saveButton: UIBarButtonItem!
   @IBOutlet private weak var cancelButton: UIBarButtonItem!
   
   override func viewDidLoad() {
      super.viewDidLoad()
   }
   
   func bindViewModel() {
      viewModel.title
         .drive(navigationItem.rx.title)
         .disposed(by: rx.disposeBag)

      viewModel.initialText
         .drive(contentTextView.rx.text)
         .disposed(by: rx.disposeBag)

      cancelButton.rx.action = viewModel.cancelAction
      saveButton.rx.tap
         .throttle(.milliseconds(500), scheduler: MainScheduler.instance)
         .withLatestFrom(contentTextView.rx.text.orEmpty)
         .bind(to: viewModel.saveAction.inputs)
         .disposed(by: rx.disposeBag)
      
      let willShowOberservable = NotificationCenter.default.rx.notification(UIResponder.keyboardWillShowNotification)
         .map { ($0.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height ?? 0 }
      
      let willHideObservable = NotificationCenter.default.rx.notification(UIResponder.keyboardWillHideNotification)
         .map { noti -> CGFloat in 0 }
      
      let keyboardObservable = Observable.merge(willShowOberservable, willHideObservable).share()
      
      keyboardObservable
         .toContentInset(of: contentTextView)
         .bind(to: contentTextView.rx.cotentInset, contentTextView.rx.scrollContentInset)
         .disposed(by: rx.disposeBag)
   }
}

extension ObservableType where Element == CGFloat {
   func toContentInset(of textView: UITextView) -> Observable<UIEdgeInsets> {
      return map { height in
         var inset = textView.contentInset
         inset.bottom = height
         return inset
      }
   }
}

extension Reactive where Base: UITextView {
   var cotentInset: Binder<UIEdgeInsets> {
      return Binder(self.base) { textView, inset in
         textView.contentInset = inset
      }
   }
}

extension Reactive where Base: UIScrollView {
   var scrollContentInset: Binder<UIEdgeInsets> {
      return Binder(self.base) { scrollView, inset in
         scrollView.contentInset = inset
      }
   }
}
