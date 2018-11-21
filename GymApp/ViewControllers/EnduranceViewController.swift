//
//  EnduranceViewController.swift
//  GymApp
//
//  Created by Bryan Albrecht on 14.11.18.
//  Copyright © 2018 Bryan Albrecht. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class EnduranceViewController: UIViewController, CLLocationManagerDelegate{

    @IBOutlet weak var coordinatesLabel: UILabel!

    let locationManager = CLLocationManager()
    var locationStatus = CLAuthorizationStatus.notDetermined
    
    
    @IBAction func changeLocationSetting(_ sender: Any) {
        
        let mySwitch = sender as! UISwitch
        
        if mySwitch.isOn{
            startReceivingLocationChanges()
        }else{
            stopReceivingLocationChanges()
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateLocationAccess()
        if locationStatus == .authorizedAlways || locationStatus == .authorizedWhenInUse{
            setupLocationManager()
            startReceivingLocationChanges()
        }
        
    }
    
    func setupLocationManager(){
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus != .authorizedWhenInUse && authorizationStatus != .authorizedAlways {
            // User has not authorized access to location information.
            return
        }
        // Do not start services that aren't available.
        if !CLLocationManager.locationServicesEnabled() {
            // Location services is not available.
            return
        }
        // Configure and start the service.
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 100.0  // In meters.
        locationManager.delegate = self
    }
    
    func updateLocationAccess(){
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted, .denied:
            locationStatus = .denied
            break
            
        case .authorizedWhenInUse:
            locationStatus = .authorizedWhenInUse
            break
            
        case .authorizedAlways:
            locationStatus = .authorizedAlways
            break
        }
    }
    
    func startReceivingLocationChanges() {
        locationManager.startUpdatingLocation()
    }
    
    func stopReceivingLocationChanges() {
        
        locationManager.stopUpdatingLocation()
        resetCooridatesLabel()
    }
    
    func resetCooridatesLabel(){
        upDateCooridnatesLabel(latitude: "XXX", longitude: "XXX")
    }
    
    func locationManager(_ manager: CLLocationManager,  didUpdateLocations locations: [CLLocation]) {
        let lastLocation = locations.last!
        upDateCooridnatesLabel(latitude: String(lastLocation.coordinate.latitude), longitude: String(lastLocation.coordinate.longitude))
    }
    
    func upDateCooridnatesLabel(latitude: String, longitude: String){
        coordinatesLabel.text = "\(latitude) / \(longitude)"
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if let error = error as? CLError, error.code == .denied {
            // Location updates are not authorized.
            stopReceivingLocationChanges()
            return
        }
        // Notify the user of any errors.
    }


}

