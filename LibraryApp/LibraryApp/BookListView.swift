//
//  ContentView.swift
//  LibraryApp
//
//  Created by Håkon Bogen on 14/10/2025.
//

import SwiftUI
import SwiftData

struct BookListView: View {
    
    @Query(sort: \Book.title) private var books: [Book]
    @Environment(\.modelContext) private var modelContext
    
    @State private var isShowingAddBookScreen = false
    
    func onDeleteBooks(at offsets: IndexSet) {
        for index in offsets {
            let book = books[index]
            modelContext.delete(book)
            
            try! modelContext.save()
        }
    }
    
    var body: some View {
        List {
            ForEach(books) { book in
                BookRowView(book: book)
            }
            .onDelete(perform: onDeleteBooks)
        }
        .navigationTitle("My books")
        .toolbar  {
            
            ToolbarItem(placement: .navigationBarTrailing) {
                Button.init {
                    // vis legg til bok-skjerm
                    isShowingAddBookScreen = true
                } label: {
                    Image(systemName: "plus")
                }
                
            }
        }.sheet(isPresented: $isShowingAddBookScreen) {
            AddBookView()
        }
        
    }
}

#Preview {
    NavigationView {
        BookListView()
    }
}
