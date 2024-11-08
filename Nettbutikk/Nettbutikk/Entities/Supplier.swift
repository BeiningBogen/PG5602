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
    
    init(id: Int, name: String, country: String, contactInfo: String) {
        self.id = id
        self.name = name
        self.country = country
        self.contactInfo = contactInfo
    }
    
    private var flagCode: String? {
        switch country.lowercased() {
            case "sweden":
                return "SE"
            case "norway":
                return "NO"
            case "germany":
                return "DE"
            default:
                return nil
        }
    }
    
    var flagURL: URL? {
        if let flagCode {
            return URL(string: "https://flagsapi.com/\(flagCode)/flat/64.png")!
        }
        return nil
    }
    
    
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
    
//    https://flagsapi.com/BE/flat/64.png
    
}
