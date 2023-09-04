//
//  Product.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import Foundation


struct Product: Identifiable {
    
    let id: UUID = UUID()
    
    let name: String
    let description: String
    let price: Int
    
}


func test() {
    let product = Product(name: "buKse", description: "", price: 34)
}
