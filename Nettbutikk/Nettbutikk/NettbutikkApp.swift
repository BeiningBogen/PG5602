//
//  NettbutikkApp.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 04/09/2024.
//

import SwiftUI
import SwiftData

@main
struct NettbutikkApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
            // Sett riktig database
                .modelContainer(sharedModelContainer)
        }
    }
}

var sharedModelContainer: ModelContainer = {
    
    // Hvilke objekter skal være i databasen? Entity = Navnet på des
    let schema = Schema([Product.self])
    
    let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
    do {
        return try ModelContainer(for: schema, configurations: modelConfiguration)
    } catch {
        
        fatalError("Coult not create model container: \(error.localizedDescription) schema: \(schema)")
    }
}()

