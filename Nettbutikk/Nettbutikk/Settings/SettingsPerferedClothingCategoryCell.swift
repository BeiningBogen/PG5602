//
//  SettingsPerferedClothingCategoryCell.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 18/09/2024.
//

import SwiftUI

struct SettingsPreferedClothingCategoryCell: View {

    @Binding var selectedClothingCategory: ClothingCategory
    var onButtonAction: (ClothingCategory) -> Void

    var body: some View {
        Button("Dame") {
            onButtonAction(.dame)
        }.background(selectedClothingCategory == .dame ? Color.gray : Color.clear)

        Button("Herre") {
            onButtonAction(.herre)
        }.background(selectedClothingCategory == .herre ? Color.gray : Color.clear)

        Button("Barn") {
            onButtonAction(.baby)
        }.background(selectedClothingCategory == .baby ? Color.gray : Color.clear)
    }
}

//#Preview {
//    SettingsPerferedClothingCategoryCell()
//}
