//
//  ContentView.swift
//  MapDemo
//
//  Created by Håkon Bogen on 08/10/2025.
//

import SwiftUI
import MapKit

struct PlaceOfInterest: Hashable {
    let name: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
}

struct ContentView: View {
    @State private var position: MapCameraPosition = .region(
        
        MKCoordinateRegion(center:
                            CLLocationCoordinate2D(latitude: 59.9139, longitude: 10.7522),
                           span:
                            MKCoordinateSpan.init(latitudeDelta: 0.02, longitudeDelta: 0.02)))
    let locations = [
        (name: "Kristiania" , lat: 59.9139, lon: 10.7522)
        
    ]
    
    let locations2 = [
        PlaceOfInterest(name: "Operahuset", latitude: 59.9075, longitude: 10.7539)
        ]
    
    var body: some View {
        Map(position: $position) {
            
            Marker("Kristiania", coordinate: CLLocationCoordinate2D(latitude: 59.9139, longitude: 10.7522))
            
            Marker("Operahuset", coordinate: CLLocationCoordinate2D(latitude: 59.9075, longitude: 10.7539))
            ForEach(locations2, id: \.self) { location in
                Marker(location.name, coordinate: CLLocationCoordinate2D.init(latitude: location.latitude, longitude: location.longitude
                                                                             ))
            }
        }
    }
}

#Preview {
    ContentView()
}
