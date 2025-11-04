//
//  LocationView.swift
//  StateDemo
//
//  Created by Håkon Bogen on 04/11/2025.
//


import SwiftUI
import Foundation
import CoreLocation
import Combine

class LocationViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var location: CLLocation?
    @Published var authorizationStatus: CLAuthorizationStatus = .notDetermined
    @Published var locationString = "Ingen lokasjon"
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        // vi abbonnerer på events fra Apple sin Location Manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func requestLocation() {
        // Be om location events når appen er i bruk // aka er åpen
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        location = locations.first
        if let location = locations.first {
            locationString = "Lat: \(String(format: "%.4f", location.coordinate.latitude)) Lon: \(String(format: "%.4f", location.coordinate.longitude))"
        }
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print(error)
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        authorizationStatus = status
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            locationManager.startUpdatingLocation()
        }
    }
    
    
}

struct LocationView: View {
    @StateObject private var locationViewModel = LocationViewModel()
    
    var body: some View {
        VStack(alignment: .leading)  {
            Text("Lokasjon")
                .font(.headline)
            Text("Status: \(locationViewModel.authorizationStatus)")
            Text("Lokasjon: \(locationViewModel.locationString)")
            Button("Be om tilgang til lokasjon") {
                locationViewModel.requestLocation()
            }
            .buttonStyle(.borderedProminent)
        }
        
    }
}
