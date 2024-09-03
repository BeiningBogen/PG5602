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
    @State var presentAlert = false
    @State var contactToBeArchivedOption1: Contact?
    @State var contactToBeArchivedOption2: Contact?

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
                                Button("Archive opt 1") {
                                    contactToBeArchivedOption1 = contact
                                    presentAlert = true
                                }.tint(.gray)
                                Button("Archive opt 2") {
                                    contactToBeArchivedOption2 = contact
                                }.tint(.red)
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
        // Option 1, alert presented via a Binding<Bool>
        }.alert("Simple alert", isPresented: $presentAlert) {
            Button("Confirm archiving", role: .destructive) {
                archive(contactToBeArchivedOption1)
                contactToBeArchivedOption1 = nil
            }
            Button("Cancel", role: .cancel) { }
        // Option 2, alert presented via a Binding<Item?>
        }.alert(item: $contactToBeArchivedOption2) { contact in
            Alert(
                title: Text("Are you sure?"),
                primaryButton: Alert.Button.destructive(Text("Yes"), action: {
                    archive(contact)
                }),
                secondaryButton: .cancel()
            )
        }
    }

    // MARK: - Private

    private func archive(_ contact: Contact?) {
        guard let contact else { return }
        archivedContacts.append(contact)
        if let foundIndex = (contacts.firstIndex { $0.id == contact.id }) {
            contacts.remove(at: foundIndex)
        }
    }

}
