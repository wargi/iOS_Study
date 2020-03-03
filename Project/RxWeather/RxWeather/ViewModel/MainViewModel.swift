import Foundation
import RxSwift
import RxCocoa
import RxDataSources
import NSObject_Rx

typealias SectionModel = AnimatableSectionModel<Int, WeatherData>

class MainViewModel: HasDisposeBag {
   
   
   
   static let tempFormatter: NumberFormatter = {
      let formatter = NumberFormatter()
      formatter.minimumFractionDigits = 0
      formatter.maximumFractionDigits = 1
      
      return formatter
   }()
   
   static let dateFormatter: DateFormatter = {
      let formatter = DateFormatter()
      formatter.locale = Locale(identifier: "Ko_kr")
      return formatter
   }()
   
   let title: BehaviorRelay<String>
   let sceneCoordinator: SceneCoordinatorType
   let weatherApi: WeatherApiType
   let locationProvider: LocationProviderType
   
   internal init(title: String, sceneCoordinator: SceneCoordinatorType, weatherApi: WeatherApiType, locationProvider: LocationProviderType) {
      self.title = BehaviorRelay(value: title)
      self.sceneCoordinator = sceneCoordinator
      self.weatherApi = weatherApi
      self.locationProvider = locationProvider
      
      locationProvider.currentAddress().bind(to: self.title)
         .disposed(by: disposeBag)
   }
   
   var weatherData: Driver<[SectionModel]> {
      return locationProvider.currentLocation()
         .flatMap { [unowned self] in
            self.weatherApi.fetch(location: $0)
               .asDriver(onErrorJustReturn: (nil, []))
      }
         .map { (summary, forecast) in
            var summaryList = [WeatherData]()
            if let summary = summary as? WeatherData {
               summaryList.append(summary)
            }
            
            return [
               SectionModel(model: 0, items: summaryList),
               SectionModel(model: 1, items: forecast as! [WeatherData])
            ]
         }
         .asDriver(onErrorJustReturn: [])
   }
   
   let dataSource: RxTableViewSectionedAnimatedDataSource<SectionModel> = {
      let ds = RxTableViewSectionedAnimatedDataSource<SectionModel>(configureCell: { (dataSource, tableView, indexPath, data) -> UITableViewCell in
         switch indexPath.section {
         case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: SummaryTableViewCell.identifier, for: indexPath) as! SummaryTableViewCell
            cell.configure(from: data, tempFormatter: MainViewModel.tempFormatter)
            return cell
         case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: ForecastTableViewCell.identifier, for: indexPath) as! ForecastTableViewCell
            cell.configure(from: data, dateFormatter: MainViewModel.dateFormatter, tempFormatter: MainViewModel.tempFormatter)
            return cell
         default:
            fatalError()
         }
      })
      
      return ds
   }()
}
