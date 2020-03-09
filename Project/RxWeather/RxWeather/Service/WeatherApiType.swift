import Foundation
import CoreLocation
import RxSwift

protocol WeatherApiType {
   @discardableResult
   func fetch(location: CLLocation) -> Observable<(WeatherDataType?, [WeatherDataType])>
}
