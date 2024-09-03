//
//  ContactList.swift
//  Forelesning3
//
//  Created by Edouard Siegel on 03/09/2024.
//

import SwiftUI

struct ContactList: View {

    @State var contacts = Contact.mocks

    var body: some View {
        List {
            ForEach($contacts) { $contact in
                ContactCell(contact: contact)
                    .swipeActions(allowsFullSwipe: false) {
                        HStack {
                            Button("Favorite") {
                                contact.isFavorite.toggle()
                            }.tint(.green)
                            Button("Some other action") {
                                print("Favorite tapped")
                            }.tint(.blue)
                        }
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: false) {
                        Button("Archive") {
                            print("Archive tapped")
                        }.tint(.gray)
                    }

            }
        }
    }

}
