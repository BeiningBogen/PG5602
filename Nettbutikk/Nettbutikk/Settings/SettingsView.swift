//
//  SettingsView.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 17/09/2024.
//

import SwiftUI

struct SettingsView: View {

    @State var userSettings = UserSettings(preferedClothingCategory: .dame)
    private let userSettingsRepository = UserSettingsRepository()

    var body: some View {
        HStack {
            Button("Dame") {
                userSettings.preferedClothingCategory = .dame
                userSettingsRepository.save(userSettings: userSettings)
            }.background(userSettings.preferedClothingCategory == .dame ? Color.gray : Color.clear)

            Button("Herre") {
                userSettings.preferedClothingCategory = .herre
                userSettingsRepository.save(userSettings: userSettings)
            }.background(userSettings.preferedClothingCategory == .herre ? Color.gray : Color.clear)

            Button("Barn") {
                userSettings.preferedClothingCategory = .baby
                userSettingsRepository.save(userSettings: userSettings)
            }.background(userSettings.preferedClothingCategory == .baby ? Color.gray : Color.clear)

        }.onAppear {
            userSettings = userSettingsRepository.get()
        }
    }
}

#Preview {
    SettingsView()
}
