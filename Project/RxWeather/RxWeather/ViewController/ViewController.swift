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

import UIKit
import CoreLocation
import RxSwift
import RxCocoa
import NSObject_Rx

class ViewController: UIViewController, ViewModelBindableType {
   var viewModel: MainViewModel!
   
   @IBOutlet weak var locationLabel: UILabel!
   
   @IBOutlet weak var listTableView: UITableView!
   
   func bindViewModel() {
      
   }
   
   override func viewDidLoad() {
      super.viewDidLoad()
      
      listTableView.backgroundColor = UIColor.clear
      listTableView.separatorStyle = .none
      listTableView.showsVerticalScrollIndicator = false
      listTableView.allowsSelection = false
   }
   
   override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      
   }

   var topInset: CGFloat = 0.0
   
   override func viewDidLayoutSubviews() {
      super.viewDidLayoutSubviews()
      
      if topInset == 0.0 {
         let first = IndexPath(row: 0, section: 0)
         if let cell = listTableView.cellForRow(at: first) {
            topInset = listTableView.frame.height - cell.frame.height
            listTableView.contentInset = UIEdgeInsets(top: topInset, left: 0, bottom: 0, right: 0)
         }
      }
   }
}

