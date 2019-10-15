//
//  ViewController.swift
//  MapView
//
//  Created by 박소정 on 2018. 4. 6..
//  Copyright © 2018년 sangwook park. All rights reserved.
//

import CoreLocation
import MapKit
import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var mapView : MKMapView!
    @IBOutlet private weak var cordinateLabel : UILabel!
    
    let locationManager = CLLocationManager()

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        moveToInitialCoordinate(())
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .denied, .restricted:
            print("앱을 사용하기 위해서는 위치 정보 사용 권한이 필요합니다.")
        case .authorizedAlways, .authorizedWhenInUse:
            locationManager.requestLocation()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //남산핀 추가
    @IBAction private func addAnnotationAtNamsan(_ sender: Any) {
        let namsan = MKPointAnnotation()
        namsan.title = "남산"
        namsan.subtitle = "남산타워"
        namsan.coordinate = CLLocationCoordinate2D(latitude: 37.5514, longitude: 126.9880)
        mapView.addAnnotation(namsan)
    }
    
    //핀 제거
    @IBAction private func removeAllAnnotations(_ sender: Any) {
        mapView.removeAnnotations(mapView.annotations)
    }
    
    //업데이트
    @IBAction private func updateCurrentLocation(_ sender: Any) {
        let coordinate = mapView.centerCoordinate
        cordinateLabel.text = String(format: "위도: %2.4f, 경도: %3.4f", arguments: [coordinate.latitude, coordinate.longitude])
    }
    
    //핀 추가
    @IBAction private func addAnnotationAtCenter(_ sender: Any) {
        let annotation = MKPointAnnotation()
        annotation.title = "MapCenter"
        annotation.coordinate = mapView.centerCoordinate
        mapView.addAnnotation(annotation)
        cordinateLabel.text = "Annotation 추가"
    }
    
    // 추적 중지
    @IBAction private func stopUpdatingLocation(_ sender: Any) {
        locationManager.stopUpdatingLocation()
    }
    
    // 추적 시작
    @IBAction private func startUpdatingLocation(_ sender: Any) {
        switch CLLocationManager.authorizationStatus() {
            case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            case .denied, .restricted:
            print("앱을 사용하기 위해서는 위치 정보 사용 권한이 필요합니다.")
            case .authorizedAlways, .authorizedWhenInUse:
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.distanceFilter = kCLDistanceFilterNone
            locationManager.startUpdatingLocation()
        }
    }

    //처음위치로
    @IBAction private func moveToInitialCoordinate(_ sender: Any) {
        let center = CLLocationCoordinate2D(latitude: 37.572851, longitude: 126.976881)
        let span = MKCoordinateSpanMake(0.01, 0.01)
        let region = MKCoordinateRegionMake(center, span)
        
        mapView.setRegion(region, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController : CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let coordinate = location.coordinate
        cordinateLabel.text = String(format: "위도: %2.4f, 경도: %3.4f", arguments: [coordinate.latitude, coordinate.latitude])
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .authorizedWhenInUse, .authorizedAlways:
            print("Authorized")
        default:
            print("Unauthorized")
        }
    }
}

