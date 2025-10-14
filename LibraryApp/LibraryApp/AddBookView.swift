//
//  AddBookView.swift
//  LibraryApp
//
//  Created by Håkon Bogen on 14/10/2025.
//

import SwiftUI
import SwiftData

struct AddBookView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var title = ""
    @State private var author = ""
    @State private var yearPublished = ""
    
    private var isValid: Bool {
        !title.isEmpty &&
        !author.isEmpty &&
        Int(yearPublished) != nil
    }
    
    func onSaveButtonTapped() {
        guard let year = Int(yearPublished) else { return }
        let newBook = Book(id: UUID(), title: title, author: author, yearpublished: year, isRead: false)
        modelContext.insert(newBook)
        dismiss()
        
        
    }
    
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
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSaveButtonTapped()
                    }
                    .disabled(!isValid)
                }
            }
        }
        Text("Hello world")
    }
}

#Preview {
    AddBookView()
}
