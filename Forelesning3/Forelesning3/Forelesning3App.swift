//
//  Forelesning3App.swift
//  Forelesning3
//
//  Created by Edouard Siegel on 02/09/2024.
//

import SwiftUI

@main
struct Forelesning3App: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                ContactList()
                    .tabItem { Text("First") }
                ImagesScrollView()
                    .tabItem { Text("Second") }
            }
        }
    }

//    // MARK: - Private
//
//    private func contactsList() -> some View {
//        List {
//            ForEach(Contact.mocks) { contact in
//                ContactCell(contact: contact)
//            }
////            ContactCell(contact: Contact.mocks[0])
////            ContactCell(contact: Contact.mocks[1])
////            ContactCell(contact: Contact.mocks[2])
////            ContactCell(contact: Contact.mocks[3])
////            ContactCell(contact: Contact.mocks[4])
//        }
//    }
}
