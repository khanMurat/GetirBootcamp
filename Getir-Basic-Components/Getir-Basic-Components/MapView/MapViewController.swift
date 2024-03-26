//
//  MapViewController.swift
//  Getir-Basic-Components
//
//  Created by Kerim Çağlar on 24.03.2024.
//

import UIKit
import MapKit

class MapViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var addressLabel: UILabel!
    
    let locationManeger = CLLocationManager()
    var lastLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        checkLocationServices()
    }
    
    func setupLocationManager() {
        locationManeger.delegate = self
        locationManeger.desiredAccuracy = kCLLocationAccuracyBest
    }

    func checkLocationServices() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocationManager()
            checkLocationAuthorization()
        } else {
            // MARK: Kullanıcıyı ayarlardan konum servisini açmaya yönlendir
        }
    }
    
    func checkLocationAuthorization() {
        
        switch CLLocationManager.authorizationStatus() {
            
        case .notDetermined:
            locationManeger.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .denied:
            break
        case .authorizedAlways:
            break
        case .authorizedWhenInUse:
            print("Kullanıcı izin vermiş")
            trackingLocation()
            break
        }
        
    }
    
    func trackingLocation() {
        mapView.showsUserLocation = true
        showUserLocationCenterMap()
        locationManeger.startUpdatingLocation()
        lastLocation = getCenterLocation(mapView: mapView)
    }
    
    func showUserLocationCenterMap() {
        if let location = locationManeger.location?.coordinate {
            let region = MKCoordinateRegion(center: location, latitudinalMeters: 100, longitudinalMeters: 100)
            mapView.setRegion(region, animated: true)
        }
    }
    
    func getCenterLocation(mapView: MKMapView) -> CLLocation {
        let latitude = mapView.centerCoordinate.latitude
        let longitude = mapView.centerCoordinate.longitude
        
        return CLLocation(latitude: latitude, longitude: longitude)
    }
}

extension MapViewController: CLLocationManagerDelegate, MKMapViewDelegate {
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
        let center = getCenterLocation(mapView: mapView)
        let geoCoder = CLGeocoder()
        
        guard let lastLocation = lastLocation else { return }
        
        guard center.distance(from: lastLocation) > 30 else { return }
        self.lastLocation = center
        
        geoCoder.reverseGeocodeLocation(center) { [weak self] placemarks, error in
            guard let self else { return }
            if let error {
                print("HATA")
                return
            }
            
            guard let placemark = placemarks?.first else { return }
            let city = placemark.locality ?? "City"
            let street = placemark.thoroughfare ?? "Street"
            
            self.addressLabel.text = "\(city) - \(street)"
        }
    }

    
}

// ÖDEV: Mümkünse kapı numarasına kadar yaklaşık olarak adresinizi verecek şekilde uygulamayı tamamlayınız

