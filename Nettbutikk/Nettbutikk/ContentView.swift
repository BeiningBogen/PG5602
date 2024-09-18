//
//  ContentView.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 04/09/2024.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Shopping", systemImage: "heart.fill")
                    // Label("Shopping", image: "baby")
                }
            NavigationStack {
                SearchView()
            }
            .tabItem {
                Label("Søk", systemImage: "magnifyingglass")
            }
            FavoritesView()
                .tabItem {
                    Label("Favorites", systemImage: "heart")
                }
            SettingsView(userSettings: UserSettingsRepository().get())
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
    }
}

#Preview {
    ContentView()
}
