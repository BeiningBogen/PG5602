//
//  UserSettings.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 17/09/2024.
//

import Foundation

class UserSettings: Codable {
    var preferedClothingCategory: ClothingCategory

    init(preferedClothingCategory: ClothingCategory) {
        self.preferedClothingCategory = preferedClothingCategory
    }

}
