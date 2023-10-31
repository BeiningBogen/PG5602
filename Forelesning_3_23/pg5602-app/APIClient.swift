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
    
    var getStores: (() async throws -> [Store])
    
    
//    func getProducts() -> [Product] {
//        if isRunninsTest {
//
//
//        } else {
//
//        }
//    }
//
//    func purchaseProducts(products: [Product]) -> Void {
//
//    }
    
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
        
        let body = try JSONEncoder().encode(products)
        urlRequest.httpBody = body
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        if let statusCode = (response as? HTTPURLResponse)?.statusCode, statusCode != 200 {
            throw APIClientError.statusCode(statusCode)
        }
        
    }, getStores: {
        var urlRequest = URLRequest.init(url: URL(string: "https://example.com/stores")!)
        urlRequest.httpMethod = "GET"
        urlRequest.allHTTPHeaderFields = ["accept": "application/json", "content-type": "application/json"]
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        if let statusCode = (response as? HTTPURLResponse)?.statusCode {
            switch statusCode {
                case 200...299:
                    // OK
                    return try JSONDecoder().decode([Store].self, from: data)
                default:
                    throw APIClientError.statusCode(statusCode)
            }
        }
        throw APIClientError.unknown
    }
    )
    
    static let demo = APIClient(getProducts: {
    
        return Product.demoProducts
        
    }, purchaseProducts: { products in
        
//        Task.sleep(for: Duration(secondsComponent: 15, attosecondsComponent: 0))
        return
    }, getStores: {
//        var store = Store()
//        store.name = "Testbutikk 1"
//        store.longitude = 10.342423
//        store.latitude = 9.32423132
//        store.openingHours = "man-lør 10:00-17:00"
        return []
    })
    
    static func error(_ error: APIClientError) -> APIClient {
        APIClient {
            throw error
        } purchaseProducts: { _ in
            throw error
        } getStores: {
            throw error
        }
    }
    
}

enum APIClientError : Error {
    case failed(underlying: Error)
    case statusCode(Int)
    case notEnoughFunds
    case stolenCard
    case unknown
    
//    case none
}


//extension Store: Decodable {
//
//    enum CodingKeys: CodingKey {
//        case name
//        case latitude
//    }
    
//    public required convenience init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.name = try container.decodeIfPresent(String.self, forKey: .name)
//        self.latitude = try container.decodeIfPresent(Float.self, forKey: .latitude)
//    }
    
    
//}
