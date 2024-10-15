//
//  Product.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 17/09/2024.
//

import Foundation
import SwiftData

@Model
class Product: Hashable, Codable, Identifiable {
    
    /// Skriv til JSON:
    func encode(to encoder: any Encoder) throws {
        
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(brand, forKey: .brand)
        try container.encode(name, forKey: .name)
        try container.encode(price, forKey: .price)
        try container.encode(fastDelivery, forKey: .fastDelivery)
        
    }
    
    /// Les inn fra JSON:
    required init(from decoder: any Decoder) throws {
        // Sette alle attributter som ikke er optional
        
        // Sette opp hvilke nøkler som kan brukes til dette objektet (container)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(Int.self, forKey: .id)
        brand = try container.decode(String.self, forKey: .brand)
        name = try container.decode(String.self, forKey: .name)
        price = try container.decode(Int.self, forKey: .price)
        fastDelivery = try container.decode(Bool.self, forKey: .fastDelivery)
        
    }
    
    init(id: Int, brand: String, name: String, price: Int, fastDelivery: Bool) {
        self.id = id
        self.brand = brand
        self.name = name
        self.price = price
        self.fastDelivery = fastDelivery
    }
    
    // let picture: Url / Asset
    var id: Int
    var brand: String
    var name: String
    var price: Int
    var fastDelivery: Bool
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case brand
        case name
        case price
        case fastDelivery = "fast_delivery"
        
    }

//    static let mock = Product(id: 0, brand: "Brand", name: "Name", price: 20, fastDelivery: false)
}


//{
//    "brand": "Nike",
//    "name": "Air Max",
//    "price": 1000,
//    "inStock": 10,
//    "fastDelivery": true
//  },


struct SearchResponse: Decodable {
    let results: [Product]
}
