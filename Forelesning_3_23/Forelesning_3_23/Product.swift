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

//var shoppingCart = [Product]()


extension Product {
    
    static let demoProducts = [
        Product.init(name: "Bukse", description: "Grå, str 32", price: 500),
        Product.init(name: "T-skjorte", description: "hvit, medium. Laget av egyptisk bomull", price: 800)
        
    ]
    
    static func testReturnProducts() -> [Product] {
        return [
            Product.init(name: "Genser", description: "Brun med mønster på magen, str 34", price: 890),
            Product.init(name: "Olabukse", description: "str 34/34", price: 1230)
        ]
    }
    
}

func aMethod() {
    
    Product.testReturnProducts()
    
}
