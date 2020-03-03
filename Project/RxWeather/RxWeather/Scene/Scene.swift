import UIKit

enum Scene {
   case main(MainViewModel)
}

extension Scene {
   func instantiate(from storyboard: String = "Main") -> UIViewController {
      let storyboard = UIStoryboard(name: storyboard, bundle: nil)
      
      switch self {
      case .main(let viewModel):
         guard var vc = storyboard.instantiateViewController(withIdentifier: "MainVC") as? ViewController else {
            fatalError()
         }
         
         vc.bind(viewModel: viewModel)
         return vc
      }
   }
}
