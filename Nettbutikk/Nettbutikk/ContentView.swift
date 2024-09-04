//
//  ContentView.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 04/09/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView {
                HomeView()
                    .tabItem {
                        Label("Shopping", systemImage: "heart.fill")
                        // Label("Shopping", image: "baby")
                    }
                
                    
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
