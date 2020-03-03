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
      viewModel.title
         .bind(to: locationLabel.rx.text)
         .disposed(by: rx.disposeBag)
      
      viewModel.weatherData
         .drive(listTableView.rx.items(dataSource: viewModel.dataSource))
         .disposed(by: rx.disposeBag)
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

