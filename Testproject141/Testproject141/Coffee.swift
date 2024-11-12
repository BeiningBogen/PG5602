//
//  Coffee.swift
//  Testproject141
//
//  Created by Håkon Bogen on 12/11/2024.
//

import Foundation

import SwiftData

@Model
class Coffee: Decodable {
    var title: String
    var coffeeDescription: String
    var ingredients: [String]
    var imageURL: URL
    var id: Int
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.coffeeDescription = try container.decode(String.self, forKey: .coffeeDescription)
        self.ingredients = try container.decode([String].self, forKey: .ingredients)
        self.imageURL = try container.decode(URL.self, forKey: .imageURL)
        self.id = try container.decode(Int.self, forKey: .id)
    }
    init (title: String, coffeeDescription: String, ingredients: [String], imageURL: URL, id: Int) {
        self.title = title
        self.coffeeDescription = coffeeDescription
        self.ingredients = ingredients
        self.imageURL = imageURL
        self.id = id
    }
    // Match nøklene i JSON
    enum Keys: String, CodingKey {
        case title
        case coffeeDescription = "description"
        case ingredients
        case imageURL = "image"
        case id
    }
}

//{
//      "title": "Black Coffee",
//      "description": "Svart kaffe är så enkelt som det kan bli med malda kaffebönor dränkta i hett vatten, serverat varmt. Och om du vill låta fancy kan du kalla svart kaffe med sitt rätta namn: café noir.",
//      "ingredients": [
//          "Coffee"
//      ],
//      "image": "https://images.unsplash.com/photo-1494314671902-399b18174975?auto=format&fit=crop&q=80&w=1887&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
//      "id": 1
//  },
