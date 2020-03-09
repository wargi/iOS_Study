import UIKit
import CoreLocation
import RxSwift
import RxCocoa
import NSObject_Rx

class CoreLocationProvider: LocationProviderType {
   private let locationManager = CLLocationManager()
   private let location = BehaviorRelay<CLLocation>(value: CLLocation.gangnamStation)
   private let address = BehaviorRelay<String>(value: "강남역")
   private let authorized
   
   @discardableResult
   func currentLocation() -> Observable<CLLocation> {
      <#code#>
   }
   
   @discardableResult
   func currentAddress() -> Observable<String> {
      <#code#>
   }
}
