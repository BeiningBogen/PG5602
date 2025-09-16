//
//  MenuView.swift
//  Forelesning7
//
//  Created by Håkon Bogen on 16/09/2025.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        TabView {
            ContentView()
                .tabItem {
                    Label("Galleri", systemImage: "photo.circle")
                }
            
            ProfileView()
                .tabItem  {
                    Label("Profil", systemImage: "person.circle")
                }
            
            VStack {
                Text("Another screen?")
            }.tabItem {
                Label("Screen 3", systemImage: "questionmark")
            }
        }
    }
}

#Preview {
    MenuView()
}
