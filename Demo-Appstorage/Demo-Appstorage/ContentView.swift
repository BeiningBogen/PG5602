//
//  ContentView.swift
//  Demo-Appstorage
//
//  Created by Håkon Bogen on 29/10/2025.
//

import SwiftUI

struct ContentView: View {
    
    // Lagres mellom hver gang appen kjører, String
    @AppStorage("username") private var username = ""
    
    // Denne blir false, ved første gangs kjøring, ellers så henter den den lagrede verdien
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    // Blir null ved første gangs kjøring, ellers henter den lagret data (fra plist i filsystemet til appen / aka UserDefaults)
    @AppStorage("favoriteNumber") private var favoriteNumber = 0
    
    // Her lagrer vi et litt mer "avansert objekt", Date. Blir satt til dagens dato første gang, ellers hentes fra persistert data, og overrides hver gang bruker endrer denne attributten
    @AppStorage("lastLoginDate") private var lastLoginDate = Date()
    
    private var dateFormatter: DateFormatter {
        /// formatere datoen når skrives ut til String
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
//        formatter.dateFormat = "ddMM - hh:mm yyyy"
        return formatter
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                Text("Appstorage demo")
                    .font(.largeTitle)
                    .bold()
                
                Text("Username")
                TextField("Enter username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                HStack {
                    Text("Dark mode")
                    Spacer()
                    Toggle("", isOn: $isDarkMode)
                }
                
                Text("Favorite number")
                    .font(.headline)
                Stepper("\(favoriteNumber)", value: $favoriteNumber, in: 0...100)
                
                Text("Last login")
                    .font(.headline)
                DatePicker("Select date", selection: $lastLoginDate).datePickerStyle(CompactDatePickerStyle())
                
                Image("myimage")
                Image(systemName: "")
                HStack {
                    Spacer()
                    VStack() {
                        Text("Current values:")
                            .font(.headline)
                        Text("Username \(username)")
                        Text("Dark mode is \(isDarkMode ? "On" : "Off")")
                        Text("Favorite number: \(favoriteNumber)")
                        Text("Last login: \(lastLoginDate, formatter: dateFormatter)")
                    }
                    Spacer()
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
