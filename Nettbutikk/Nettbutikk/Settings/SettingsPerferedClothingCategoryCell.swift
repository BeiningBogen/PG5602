//
//  SettingsPerferedClothingCategoryCell.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 18/09/2024.
//

import SwiftUI

struct SettingsPreferedClothingCategoryCell: View {

    @State var selectedClothingCategory: ClothingCategory
    var onButtonAction: (ClothingCategory) -> Void

    var body: some View {
        let _ = Self._printChanges()
        Button("Dame") {
            onButtonAction(.dame)
//            userSettings.preferedClothingCategory = .dame
//            userSettingsRepository.save(userSettings: userSettings)
        }.background(selectedClothingCategory == .dame ? Color.gray : Color.clear)

        Button("Herre") {
            onButtonAction(.herre)
//            userSettings.preferedClothingCategory = .herre
//            userSettingsRepository.save(userSettings: userSettings)
        }.background(selectedClothingCategory == .herre ? Color.gray : Color.clear)

        Button("Barn") {
            onButtonAction(.baby)
//            userSettings.preferedClothingCategory = .baby
//            userSettingsRepository.save(userSettings: userSettings)
        }.background(selectedClothingCategory == .baby ? Color.gray : Color.clear)
    }
}

//#Preview {
//    SettingsPerferedClothingCategoryCell()
//}
