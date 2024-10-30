//
//  Product+SwiftData.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 15/10/2024.
//

import Foundation
import SwiftData

extension Product {
    
    //
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
    func storeInDatabase(context: ModelContext) {
         
        // Lag en kopi av self (Produktet), og legg inn i databasen
        context.insert(Product(id: self.id, brand: self.brand, name: self.name, price: self.price, fastDelivery: self.fastDelivery))
        do {
            // Skriv endringer i modelcontext til disk
            try context.save()
        } catch {
            print("Could not store product \(self), error: \(error)")
        }
    }
    // Slett fra databasen
    // context: Hvilken database vi skal slette fra
    func deleteFromDatabase(context: ModelContext) {
        
        // Hent ut produkt med samme id som self
        if let product = Product.allStoredProducts(withId: self.id, inContext: context).first {
            
            /// Slett produktet fra databasen
            context.delete(product)
            
            do {
                // Lagre endringer i modelcontext til disk
                try context.save()
                
            } catch {
                print("Could not delete product from database: \(self), error: \(error)")
            }
        } else {
            print("Could not find product to delete \(self)")
        }
        
    }
    
//    update
}

// Ikke gjør dette:
//func storedProducts() -> [Product] {
//    []
//}
