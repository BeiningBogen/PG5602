//
//  Demo_AppstorageApp.swift
//  Demo-Appstorage
//
//  Created by Håkon Bogen on 29/10/2025.
//

import SwiftUI

@main
struct Demo_AppstorageApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContentView()
                
                SearchFieldDemoView()
                
            }
        }
    }
}
