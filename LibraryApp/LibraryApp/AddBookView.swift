//
//  AddBookView.swift
//  LibraryApp
//
//  Created by Håkon Bogen on 14/10/2025.
//

import SwiftUI

struct AddBookView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var title = ""
    @State private var author = ""
    @State private var yearPublished = ""
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Book details") {
                    TextField("Title", text: $title)
                    TextField("Author", text: $author)
                    TextField("Year published", text: $yearPublished)
                        .keyboardType(.numberPad)
                }
            }
            .navigationTitle("Add book")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
        Text("Hello world")
    }
}

#Preview {
    AddBookView()
}
