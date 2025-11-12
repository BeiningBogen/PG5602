//
//  ContentView.swift
//  FilteringSortingExample
//
//  Created by Håkon Bogen on 12/11/2025.
//

import SwiftUI
import CoreLocation
import Combine
// Location repetisjon

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    private let locationManager = CLLocationManager()
    @Published var userLocation: CLLocation?
    // Override standard init til NSObject, sånn at kan gjøre ting når denne klassen opprettes
    override init() {
        super.init()
        
        // denne klassen (LocationManager), skal abbonnere på eventer fra CLLocationManager
        // eksempel eventer: brukeren sin lokasjon ble oppdatert, brukeren ga tilgang til lokasjonen sin til appen, brukeren forflyttet seg 10 meter osv...
        locationManager.delegate = self
        // Be brukeren, den som kjører appen om lov til å få disse eventene
        locationManager.requestWhenInUseAuthorization()
    }
    
    func askForPermission() {
        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations.last
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: any Error) {
        print("Location error: \(error)")
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // hvis bruker ga tilgang til "when app is in use"
        if status == .authorizedWhenInUse {
            // Be om at locationmanager får oppdateringer om location
            locationManager.requestLocation()
        }
    }
    
}

///////// ////
struct Student: Identifiable {
    
    let id = UUID()
    let name: String
    let age: Int
    let grade: Double
    let subject: String
    
}


struct ContentView: View {
    
    @StateObject private var locationManager = LocationManager()
    
    @State private var students = [
        Student(name: "Anna", age: 20, grade: 8.5, subject: "Computer science"),
        Student(name: "Bob", age: 22, grade: 9.1, subject: "Mathematics"),
        Student(name: "Frank", age: 34, grade: 5.5, subject: "Computer science")
        
    ]
    
    enum SortOption: String, CaseIterable {
        case name = "Name"
        case age = "Age"
        case grade = "Grade"
    }
    
    let subjects = ["All", "Mathematics", "Computer science", "Physics"]
    
    @State private var searchText = ""
    @State private var selectedSubject = "All"
    @State private var minimumGrade = 0.0
    @State private var sortOption = SortOption.name
    
    var filteredAndSortedStudents: [Student] {
        // lag en kopi som vi kan endre/filtrere/sortere
        var result = students
        
        if !searchText.isEmpty {
            result = result.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
        }
        
        if selectedSubject != "All" {
            result = result.filter { $0.subject == selectedSubject }
        }
        
        result = result.filter { $0.grade >= minimumGrade }
        
        switch sortOption {
            case .name:
                result = result.sorted { $0.name < $1.name }
            case .age:
                result = result.sorted { $0.age < $1.age }
            case .grade:
                result = result.sorted { $0.grade > $1.grade }
        }
        
        
        return result
    }
    
    
    var body: some View {
        NavigationView {
            VStack {
                
                VStack(spacing: 16) {
                    SearchBar(text: $searchText)
                    HStack {
                        
                        Picker("Subject", selection: $selectedSubject) {
                            ForEach(subjects, id: \.self) { subject in
                                Text(subject).tag(subject)
                            }
                        }
                        
                    }.pickerStyle(MenuPickerStyle())
                    
                  //  Spacer()
                    
                    Picker("Sort by", selection: $sortOption) {
                        ForEach(SortOption.allCases, id: \.self) { option in
                            Text(option.rawValue).tag(option)
                        }
                    }
                    
                    VStack {
                        Text("Minimum grade: \(minimumGrade, specifier: "%.1f")")
                        Slider(value: $minimumGrade, in: 0...10, step: 0.1)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                
                List(filteredAndSortedStudents) { student in
                    StudentRow(student: student)
                }
                .listStyle(.plain)
                
                Text("\(filteredAndSortedStudents.count)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Button("Oppdater lokasjon") {
                    print(locationManager.userLocation)
                    locationManager.askForPermission()
                }
                if let userLocation = locationManager.userLocation {
                    Text("\(userLocation)")
                }
            }
            
            .padding()
        }
      
    }
}

struct StudentRow: View {
    
    let student: Student
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(student.name)
                    .font(.headline)
                Spacer()
                Text("\(student.grade, specifier: "%.1f")")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(Color.fromGrade(student.grade))
            }
            HStack {
                Text("Age: \(student.age)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Spacer()
                Text(student.subject)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(Color.blue.opacity(0.1))
                    .cornerRadius(4)
            }
        }
        .padding(.vertical, 4)
    }
    
   
}

extension Color {
    
    static func fromGrade(_ grade: Double) -> Color {
        switch grade {
            case 9...:
                return .green
            case 7..<9:
                return .orange
            default:
                return .red
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundStyle(.secondary)
            
            TextField("Search students...", text: $text)
                .textFieldStyle(.roundedBorder)
        }
    }
}


#Preview {
    ContentView()
}
