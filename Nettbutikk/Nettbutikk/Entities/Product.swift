//
//  Product.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 17/09/2024.
//

import Foundation

struct Product: Hashable, Codable, Identifiable {
    // let picture: Url / Asset
    let id: Int
    let brand: String
    let name: String
    let price: Int
    let fastDelivery: Bool

    static let mock = Product(id: 0, brand: "Brand", name: "Name", price: 20, fastDelivery: false)
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
