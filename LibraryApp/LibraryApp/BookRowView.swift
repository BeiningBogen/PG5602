//
//  BookRowView.swift
//  LibraryApp
//
//  Created by Håkon Bogen on 14/10/2025.
//

import SwiftUI

struct BookRowView: View {
    
    let book: Book
    @Environment(\.modelContext) private var modelContext
    
    func onToggleButtonTapped() {
        book.isRead.toggle()
        
    }
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                Text(book.title)
                    .font(.headline)
                Text(book.author)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
                Text("Published: \(book.yearpublished)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Spacer()
            Button(action: onToggleButtonTapped) {
                Image(systemName: book.isRead ? "book.fill" : "book")
                    .foregroundStyle(book.isRead ? .green : .gray)
                
            }.buttonStyle(.plain)
        }
        .padding(.leading, 8)
    }
}

#Preview {
    List {
        BookRowView(book: Book(id: UUID(), title: "LOTR", author: "JRR Tolkien", yearpublished: 1966, isRead: false))
    }
}
