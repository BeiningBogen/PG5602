//
//  SearchRepository.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 17/09/2024.
//

import Foundation
import UIKit

struct SearchRepository {

    func fetchSearchResults() async -> [Product] {
//        Sleep()
        guard let jsonData = NSDataAsset(name: "SearchResults")?.data else {
            return []
        }
        do {
            let decodeProducts = try JSONDecoder().decode(SearchResponse.self, from: jsonData)
//            return try JSONDecoder().decode([Product].self, from: jsonData)
            return decodeProducts.results
        } catch {
            print(error)
        }

//        let decodedProducts = try? JSONDecoder().decode(Product.self, from: jsonData)
        // let decodedProducts2 = try! JSONDecoder().decode(Product.self, from: jsonData)
        return []
    }

}
