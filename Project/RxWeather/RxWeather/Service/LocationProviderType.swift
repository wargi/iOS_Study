import Foundation
import CoreLocation
import RxSwift

protocol LocationProviderType {
   @discardableResult
   func currentLocation() -> Observable<CLLocation>
   
   @discardableResult
   func currentAddress() -> Observable<String>
}


