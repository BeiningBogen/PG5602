//
//  User.swift
//  Forelesning8
//
//  Created by Håkon Bogen on 17/09/2025.
//


struct User: Decodable, Identifiable {
    
  //  let id2: UUID = UUID()
    let id: Int
    let name: String
    let email: String
    let website: String?
    let address: Address
    
    struct Address: Decodable {
        
        let street: String
        let zipCode: String
        
    }
    
    
    
}
