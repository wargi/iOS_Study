import UIKit
import CoreLocation
import RxSwift
import RxCocoa

extension CLLocationManager: HasDelegate {
   public typealias Delegate = CLLocationManagerDelegate
}

public class RxCLLocationManagerDelegateProxy: DelegateProxy<CLLocationManager, CLLocationManagerDelegate>, DelegateProxyType, CLLocationManagerDelegate {
   public init(locationManager: CLLocationManager) {
      super.init(parentObject: locationManager, delegateProxy: RxCLLocationManagerDelegateProxy.self)
   }
   
   public static func registerKnownImplementations() {
      self.register { RxCLLocationManagerDelegateProxy(locationManager: $0) }
   }
}

extension Reactive where Base: CLLocationManager {
   var delegate: DelegateProxy<CLLocationManager, CLLocationManagerDelegate> {
      return RxCLLocationManagerDelegateProxy.proxy(for: base)
   }
   
   var didUpdateLocations: Observable<[CLLocation]> {
      return delegate.methodInvoked(#selector(CLLocationManagerDelegate.locationManager(_:didUpdateLocations:)))
         .map { parameters in
            return parameters[1] as! [CLLocation]
         }
   }
   
   var didChangeAuthorizationStatus: Observable<CLAuthorizationStatus> {
      return delegate.methodInvoked(#selector(CLLocationManagerDelegate.locationManager(_:didChangeAuthorization:)))
         .map { parameters in
            return CLAuthorizationStatus(rawValue: parameters[1] as! Int32) ?? CLAuthorizationStatus.notDetermined
      }
   }
}
