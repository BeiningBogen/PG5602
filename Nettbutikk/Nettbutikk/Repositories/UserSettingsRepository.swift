//
//  UserSettingsRepository.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 17/09/2024.
//

import Foundation

// Storing persistent data
//
// * Documents folder
// * UserDefaults
// * CoreData / SwiftData
// * Keychain
// * AppGroup

struct UserSettingsRepository {

    static let userSettingsKey = "userSettingsKey"

    func get() -> UserSettings {
        guard let data = UserDefaults.standard.data(forKey: Self.userSettingsKey) else {
            return UserSettings(preferedClothingCategory: .dame)
        }
        // We would need some proper error management instead of the ’try?’
        let decoded = try? PropertyListDecoder().decode(UserSettings.self, from: data)
        return decoded ?? UserSettings(preferedClothingCategory: .dame)
    }

    func save(userSettings: UserSettings) {
        do {
            let encoded = try PropertyListEncoder().encode(userSettings)
            UserDefaults.standard.set(encoded, forKey: Self.userSettingsKey)
        } catch {
            print("error")
        }
    }

//    public func set<T>(object: T, for key: String) throws where T: Codable {
//        let encoded = try PropertyListEncoder().encode(object)
//        userDefaults.setValue(encoded, forKey: key)
//    }
//
//    public func get<T>(for key: String) throws -> T? where T: Codable {
//        guard let data = userDefaults.data(forKey: key) else {
//            return nil
//        }
//        return try PropertyListDecoder().decode(T.self, from: data)
//    }


}
