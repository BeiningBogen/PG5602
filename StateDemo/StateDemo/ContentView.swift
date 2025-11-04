//
//  ContentView.swift
//  StateDemo
//
//  Created by Håkon Bogen on 04/11/2025.
//

import SwiftUI
import Foundation
import Combine

@MainActor
class UserDataManager: ObservableObject {
    @Published var username = "Ola Nordmann"
    @Published var userAge = 25
    @Published var isLoggedIn = false
    
    func login() {
        isLoggedIn = true
        // sende til server
        // vise feilmelding hvis det feiler
        // lagre i keychain / swiftdata
    }
    
    func logout() {
        isLoggedIn = false
    }
    
    func updateUserInfo(name: String, age: Int ) {
        username = name
        userAge = age
    }
}

// Husk å dele opp disse i egne filer
@MainActor
class SettingsStore: ObservableObject {
    
    @Published var isDarkMode = false
    @Published var notificationsEnabled = false
    @Published var fontSize = 16.0
    
}

struct ContentView: View {
    // State for kun dette viewet
    @State private var counter = 0
    @State private var selectedTab = 0
    
    
    @StateObject private var settings = SettingsStore()
    @StateObject private var userDataManager = UserDataManager()

    var body: some View {
        NavigationView {
            TabView(selection: $selectedTab)  {
                
                // Tab 1
                ScrollView {
                    
                }.tabItem {
                    Image(systemName: "1.circle")
                    Text("@State")
                }
                .tag(0) // marker så index 0 = denne taben, hvis du setter selectedTab
                
                ScrollView {
                    UserProfileView()
                    LocationView()
                }.tabItem  {
                    Image(systemName: "2.circle")
                    Text("Observable")
                }
                .tag(1)
            }
            .environmentObject(settings)
            .environmentObject(userDataManager)
            .navigationTitle("State Management")
            
        }
        .preferredColorScheme(settings.isDarkMode ? .dark : .light)
      
    }
}

#Preview {
    ContentView()
}
