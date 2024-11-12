//
//  Testproject141App.swift
//  Testproject141
//
//  Created by Håkon Bogen on 12/11/2024.
//

import SwiftUI
import SwiftData

@main
struct Testproject141App: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView(isRunningPreview: false)
        }
        .modelContainer(sharedModelContainer)
    }
}
