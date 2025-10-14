//
//  LibraryAppApp.swift
//  LibraryApp
//
//  Created by Håkon Bogen on 14/10/2025.
//

import SwiftUI
import SwiftData

@main
struct LibraryAppApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                BookListView()
            }
            .modelContainer(for: Book.self)
        }
    }
}
#Preview {
    BookListView()
}
