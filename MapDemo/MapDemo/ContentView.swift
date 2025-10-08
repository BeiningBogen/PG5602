//
//  ContentView.swift
//  MapDemo
//
//  Created by Håkon Bogen on 08/10/2025.
//

import SwiftUI
import MapKit

struct PulsingPinView : View {
    
    @State private var isPulsing = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.red.opacity(0.3))
                .frame(width: 60, height: 60)
                .scaleEffect(isPulsing ? 1.2 : 1.0)
                .opacity(isPulsing ? 0 : 1)
            
            Circle()
                .fill(.red.opacity(0.5))
                .frame(width: 40, height: 40)
            
            ZStack {
                Circle()
                    .fill(.red)
                    .frame(width: 30, height: 30)
                Image(systemName: "mappin.circle.fill")
                    .foregroundStyle(isPulsing ? .white : .yellow)
                    .font(isPulsing ? .caption2 : .title)
            }
            
            
        }.onAppear {
            withAnimation(
                .easeInOut(duration: 1.5)
                .repeatForever(autoreverses: false)) {
                isPulsing = true
            }
        }
    }
}
#Preview("Pulsing pin view") {
    PulsingPinView()
}

struct PlaceOfInterest: Hashable {
    let name: String
    let latitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}


struct ContentView: View {
    @State private var position: MapCameraPosition = .region(
        
        MKCoordinateRegion(center:
                            CLLocationCoordinate2D(latitude: 59.9139, longitude: 10.7522),
                           span:
                            MKCoordinateSpan.init(latitudeDelta: 0.02, longitudeDelta: 0.02)))
    
    @State private var isShowingSheet = false
    @State private var selectedPOI: PlaceOfInterest?
    
    let locations = [
        (name: "Kristiania" , lat: 59.9139, lon: 10.7522)
        
    ]
    
    let locations2 = [
        PlaceOfInterest(name: "Operahuset", latitude: 59.9075, longitude: 10.7539),
        PlaceOfInterest(name: "Kristiania", latitude: 59.9139, longitude: 10.7522)
        
    ]
    
    var body: some View {
        ZStack {
            Map(position: $position) {
                
                //            Marker("Kristiania", coordinate: CLLocationCoordinate2D(latitude: 59.9139, longitude: 10.7522))
                
                //            Marker("Operahuset", coordinate: CLLocationCoordinate2D(latitude: 59.9075, longitude: 10.7539))
                ForEach(locations2, id: \.self) { location in
                    
                    // hvis du vil ha ballongforma:
                    //                Marker(location.name, coordinate: CLLocationCoordinate2D.init(latitude: location.latitude, longitude: location.longitude))
                    //                    .tint(location.name == "Kristiania" ? .green : .red)
                    Annotation(location.name, coordinate: location.coordinate) {
                        Button {
                            print(location.name)
                            selectedPOI = location
                            // isShowingSheet = true
                        } label: {
                            if selectedPOI == location {
                                PulsingPinView()
                            } else {
                                ZStack {
                                    Circle()
                                        .fill(.red)
                                        .frame(width: 40)
                                    Image(systemName: "building.2")
                                        .foregroundStyle(.white)
                                }
                            }
                        }.sheet(isPresented: $isShowingSheet) {
                            
                            if let selectedPOI = selectedPOI {
                                Text(selectedPOI.name)
                            } else {
                                Text("Fant ikke lokasjonsinfo")
                            }
                        }
                    }
                }
            }
            VStack {
                Spacer()
                
            Button {
                // Zoom inn til min pos
                position = .region(MKCoordinateRegion.init(center:
                        .init(latitude: 50, longitude: 10), span:
                        .init(latitudeDelta: 0.2, longitudeDelta: 0.2)))qq
            } label: {
               
                    ZStack {
                        Circle()
                            .frame(width: 40)
                        Image(systemName: "person")
                            .foregroundStyle(.white)
                    }
                }
            }

        }
    }
}

#Preview {
    ContentView()
}
