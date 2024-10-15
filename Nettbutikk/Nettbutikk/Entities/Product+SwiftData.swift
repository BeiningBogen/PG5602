//
//  Product+SwiftData.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 15/10/2024.
//

import Foundation
import SwiftData

extension Product {
    
    static func allStoredProducts(withId id: Int? = nil, inContext context: ModelContext) -> [Product] {
        
        var fetchDescriptor = FetchDescriptor<Product>()
        // Hvis vi sender inn id, så filtrer ut alle produkter med den iden, hvis ikke, returner alle produkter
        if let id {
            fetchDescriptor.predicate = #Predicate { product in
                return product.id == id
            }
        }
        
        do {
            return try context.fetch(fetchDescriptor)
        } catch {
            print("Error in fetch \(fetchDescriptor)")
            fatalError("error in fetch \(fetchDescriptor)")
//            return [Product]()
        }
        
        
       
    }
    
//    func delete() {
//        
//    }
    
//    insert
    
//    update
}

// Ikke gjør dette:
//func storedProducts() -> [Product] {
//    []
//}
