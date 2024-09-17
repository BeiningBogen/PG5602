//
//  SettingsView.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 17/09/2024.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        HStack {
            Button("Dame") {
                print("Dame")
            }
            Button("Herre") {
                print("Herre")
            }
            Button("Barn") {
                print("Barn")
            }
        }
    }
}

#Preview {
    SettingsView()
}


// Storing persistent data
//
// * Documents folder
// * UserDefaults
// * CoreData / SwiftData
// * Keychain
// * AppGroup
