//
//  APIClient.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 09/10/2023.
//

import Foundation

struct APIClient {
    
    var getProducts: (() async throws -> [Product])
    
    var purchaseProducts: (([Product]) async throws -> ())
    
    
}

extension APIClient {
    
    static let live = APIClient(getProducts: {
        
        let url = URL(string:  "https://raw.githubusercontent.com/BeiningBogen/PG5602/master/products.json")!
        
        let (data, response) = try await URLSession.shared.data(from: url)
        let products = try JSONDecoder().decode([Product].self, from: data)
        
        return products
        
    }, purchaseProducts: { products in
        let url = URL(string:  "https://raw.githubusercontent.com/BeiningBogen/PG5602/master/products.json")!
        var urlRequest = URLRequest.init(url: url)
        urlRequest.httpMethod = "POST"
        let data = try JSONEncoder().encode(products)
        urlRequest.httpBody = data
    }
    )
    
    static let demo = APIClient(getProducts: {
        
        let product = Product.init(name: "Tøfler", description: "grå kule tøfler, str 42", price: 902, images: [ProductImage]())
        let product2 = Product.init(name: "Merketøfler", description: "grå kule tøfler,Gucci, str 43", price: 99000, images: [ProductImage]())
        
        return [product, product2]
    })
}
