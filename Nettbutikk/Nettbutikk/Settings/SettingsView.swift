//
//  SettingsView.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 17/09/2024.
//

import SwiftUI

struct SettingsView: View {

    @State var userSettings: UserSettings
    private let userSettingsRepository = UserSettingsRepository()

    var body: some View {
        let _ = Self._printChanges()
        HStack {
            SettingsPreferedClothingCategoryCell(
                selectedClothingCategory: userSettings.preferedClothingCategory) { clothingCategory in
                    print("tapped: \(clothingCategory)")
                    userSettings = UserSettings(preferedClothingCategory: clothingCategory)
                    userSettingsRepository.save(userSettings: userSettings)
                }
        }
    }
}
