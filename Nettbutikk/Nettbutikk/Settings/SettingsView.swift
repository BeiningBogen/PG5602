//
//  SettingsView.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 17/09/2024.
//

import SwiftUI

struct SettingsView: View {

    @ObservedObject var userSettings: UserSettings
    private let userSettingsRepository = UserSettingsRepository()

    var body: some View {
        HStack {
            SettingsPreferedClothingCategoryCell(
                selectedClothingCategory: $userSettings.preferedClothingCategory) { clothingCategory in
                    userSettings.preferedClothingCategory = clothingCategory
                    userSettingsRepository.save(userSettings: userSettings)
                }
        }
    }
}
