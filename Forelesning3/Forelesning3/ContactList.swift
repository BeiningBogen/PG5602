//
//  ContactList.swift
//  Forelesning3
//
//  Created by Edouard Siegel on 03/09/2024.
//

import SwiftUI

struct ContactList: View {

    @State var contacts = Contact.mocks
    @State var archivedContacts: [Contact] = []
    @State var presentSettingsSheet = false
    @State var displayOnlyFavoriteContacts = false
    @State var contactToBeArchived: Contact?

    var body: some View {
        List {
            ForEach($contacts) { $contact in
                if displayOnlyFavoriteContacts && !contact.isFavorite {
                    EmptyView()
                } else {
                    NavigationLink(destination: {
                        ContactDetail(contact: contact)
                    }, label: {
                        ContactCell(contact: contact)
                            .swipeActions(allowsFullSwipe: false) {
                                Button("Favorite") {
                                    contact.isFavorite.toggle()
                                }.tint(.green)
                            }
                            .swipeActions(edge: .leading, allowsFullSwipe: false) {
                                Button("Archive") {
                                    contactToBeArchived = contact
                                    print("Archive tapped")
                                }.tint(.gray)
                            }
                    })
                }
            }
        }
        .navigationTitle("My contacts")
        .toolbar {
            Button("Settings") {
                print("settings tapped")
                presentSettingsSheet = true
            }
//        }.sheet(isPresented: $presentSettingsSheet, content: {
//            Text("Settings")
//        })
        }.sheet(isPresented: $presentSettingsSheet) {
            Toggle(
                "Only display favorite contacts",
                isOn: $displayOnlyFavoriteContacts
            )
            .padding()
//        }.alert(item: $contactToBeArchived, content: { contact in
//            Alert(title: Text("Are you sure?"), primaryButton:
//                    Button("Confirm", role: .destructive, action: {
//
//            },
//                  secondaryButton: Alert.Button("Cancel", role: .cancel) {
//                contactToBeArchived = nil
//            }
//            )
//
////                    archivedContacts.append(contact)
////                    if let foundIndex = contacts.firstIndex { $0.id == contact.id } {
////                        contacts.remove(at: foundIndex)
////                    }
//                }
        }
    }

}
