//
//  Forelesning22App.swift
//  Forelesning22
//
//  Created by Håkon Bogen on 07/11/2023.
//

import SwiftUI

@main
struct Forelesning22App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
