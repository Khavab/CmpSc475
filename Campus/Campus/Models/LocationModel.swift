//
//  LocationModel.swift
//  Campus
//
//  Created by Shibli Nomani on 2/27/24.
//

import Foundation
import MapKit

class LocationModel: NSObject, CLLocationManagerDelegate {
    var locationManager = CLLocationManager()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    var didUpdateLocations: (([CLLocation]) -> Void)?
    var didChangeAuthorization: ((CLAuthorizationStatus) -> Void)?

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        didUpdateLocations?(locations)
    }

    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        didChangeAuthorization?(status)
    }
}
