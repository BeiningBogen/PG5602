//
//  Forelesning21App.swift
//  Forelesning21
//
//  Created by Håkon Bogen on 06/11/2023.
//

import SwiftUI

@main
struct Forelesning21App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
