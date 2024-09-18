//
//  UserSettings.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 17/09/2024.
//

import Foundation

class UserSettings: Codable, ObservableObject {
    @Published var preferedClothingCategory: ClothingCategory

    init(preferedClothingCategory: ClothingCategory) {
        self.preferedClothingCategory = preferedClothingCategory
    }

    enum CodingKeys: CodingKey {
        case preferedClothingCategory
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        preferedClothingCategory = try container.decode(ClothingCategory.self, forKey: .preferedClothingCategory)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(preferedClothingCategory, forKey: .preferedClothingCategory)
    }
}
