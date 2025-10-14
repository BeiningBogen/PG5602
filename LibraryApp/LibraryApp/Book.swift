//
//  Book.swift
//  LibraryApp
//
//  Created by Håkon Bogen on 14/10/2025.
//
import SwiftUI
import SwiftData

@Model
class Book {
    
    var id: UUID
    var title: String
    var author: String
    var yearpublished: Int
    var isRead: Bool
    
    init(id: UUID, title: String, author: String, yearpublished: Int, isRead: Bool) {
        self.id = id
        self.title = title
        self.author = author
        self.yearpublished = yearpublished
        self.isRead = isRead
    }
    
}
