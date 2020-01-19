//
//  MemoDetailViewController.swift
//  RxMemo
//
//  Created by 박상욱 on 2020/01/14.
//  Copyright © 2020 sangwook park. All rights reserved.
//

import UIKit

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
      
   }
}
