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
    
    var body: some View {
        List {
            ForEach(books) { book in
                Text(book.title)
            }
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
    //    .foregroundStyle(.black)
        
    }
}

#Preview {
    NavigationView {
        BookListView()
    }
}
