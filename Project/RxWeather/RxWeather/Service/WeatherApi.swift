import Foundation
import RxSwift
import RxCocoa
import CoreLocation
import NSObject_Rx

class SKWeatherApi: NSObject, WeatherApiType {
   private let summaryRelay = BehaviorRelay<WeatherDataType?>(value: nil)
   private let forecastRelay = BehaviorRelay<[WeatherDataType]>(value: [])
   private let urlSession = URLSession.shared
   private func fetchSummary(location: CLLocation) -> Observable<WeatherDataType?> {
      let request = composeUrlRequest(endpoint: summaryEndpoint, from: location)
      
      return urlSession.rx.data(request: request)
         .map { data -> WeatherSummary in
            let decoder = JSONDecoder()
            return try decoder.decode(WeatherSummary.self, from: data)
      }
      .map { WeatherData(summary: $0) }
      .catchErrorJustReturn(nil)
   }
   
   private func fetchForecast(location: CLLocation) -> Observable<[WeatherDataType]> {
      let request = composeUrlRequest(endpoint: forecastEndpoint, from: location)
      
      return urlSession.rx.data(request: request)
         .map { data -> [WeatherData] in
            let decoder = JSONDecoder()
            let forecast = try decoder.decode(Forecast.self, from: data)
            if let list = forecast.weather.forecast3days.first?.fcst3hour.arrayRepresentation() {
               return list
            }
            return [WeatherData]()
      }
   .catchErrorJustReturn([WeatherDataType]())
   }
   
   
   @discardableResult
   func fetch(location: CLLocation) -> Observable<(WeatherDataType?, [WeatherDataType])> {
      let summary = fetchSummary(location: location)
      let forecast = fetchForecast(location: location)
      
      Observable.zip(summary, forecast)
         .subscribe(onNext: { [weak self] result in
            self?.summaryRelay.accept(result.0)
            self?.forecastRelay.accept(result.1)
         })
         .disposed(by: rx.disposeBag)
      return Observable.combineLatest(summaryRelay.asObservable(), forecastRelay.asObservable())
   }
   
   
}
