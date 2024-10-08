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
                FavoritesView(products: [])
                    .tabItem {
                        Label("Favorites", systemImage: "heart")
                    }
                
                BasketView()
                    .tabItem {
                        Label("Cart", systemImage: "basket")
                    }
                    .toolbarBackground(.white, for: .tabBar)
                    .toolbarBackground(.visible, for: .tabBar)
                    
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
