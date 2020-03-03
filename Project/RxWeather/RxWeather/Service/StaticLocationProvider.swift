import Foundation
import CoreLocation
import RxSwift

struct StaticLocationProvider: LocationProviderType {
   func currentLocation() -> Observable<CLLocation> {
      return Observable.just(CLLocation.gangnamStation)
   }
   
   func currentAddress() -> Observable<String> {
      return Observable.just("강남역")
   }
}
