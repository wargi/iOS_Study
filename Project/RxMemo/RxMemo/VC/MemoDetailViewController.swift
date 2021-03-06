//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by 박상욱 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class MemoDetailViewController: UIViewController, ViewModelBindableType {
   
   var viewModel: MemoDetailViewModel!
   @IBOutlet private weak var listTableView: UITableView!
   @IBOutlet private weak var editButton: UIBarButtonItem!
   @IBOutlet private weak var deleteButton: UIBarButtonItem!
   @IBOutlet private weak var shareButton: UIBarButtonItem!
   
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
   }
   
   func bindViewModel() {
      viewModel.title
         .drive(navigationItem.rx.title)
         .disposed(by: rx.disposeBag)
      
      viewModel.contents
         .bind(to: listTableView.rx.items) { tableView, row, value in
            switch row {
            case 0:
               let cell = tableView.dequeueReusableCell(withIdentifier: "contentCell")!
               cell.textLabel?.text = value
               return cell
            case 1:
               let cell = tableView.dequeueReusableCell(withIdentifier: "dateCell")!
               cell.textLabel?.text = value
               return cell
            default:
               fatalError()
            }
      }
      .disposed(by: rx.disposeBag)
      
      editButton.rx.action = viewModel.makeEditAction()
      
      deleteButton.rx.action = viewModel.makeDeleteAction()
      
      shareButton.rx.action = viewModel.shareAction(to: self)
   }
   
}
