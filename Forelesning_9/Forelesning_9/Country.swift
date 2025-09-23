//
//  Country.swift
//  Forelesning_9
//
//  Created by Håkon Bogen on 23/09/2025.
//


struct Country: Decodable, Identifiable {
    
    struct CountryName: Decodable {
        let common: String
        let official: String
    }
    
    let name: CountryName
    // Computed variabel:
    var id: String { name.common }
    let region: String
    let subregion: String?
    let population: Int
    let flag: String
    let flags: Flag
    
    struct Flag: Decodable {
        let png: String
        let svg: String
        let alt: String?
    }
    
    let coatOfArms: CoatOfArms
        
    struct CoatOfArms: Decodable {
        let png: String?
        let svg: String?
    }
    
}
