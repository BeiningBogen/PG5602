//
//  Supplier.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 05/11/2024.
//

import Foundation
import SwiftData

@Model
class Supplier: Decodable {
    
    var id: Int
    var name: String
    var country: String
    var contactInfo: String
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: Keys.self)
        
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.country = try container.decode(String.self, forKey: .country)
        self.contactInfo = try container.decode(String.self, forKey: .contactInfo)

    }
    
    enum Keys: String, CodingKey {
        case id
        case name
        case country
        case contactInfo = "contact_info"
    }
    
}
