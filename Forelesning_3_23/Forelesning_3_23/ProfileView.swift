//
//  ProfileView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 19/09/2023.
//

import SwiftUI
import KeychainSwift


enum AppStorageKeys: String {
    case username
    case password
}

struct ProfileView: View {
    
    //    @AppStorage(AppStorageKeys.username.rawValue) var username: String?
    
    @State var username: String?
    @State var password = ""
    
    @State var isLoggedIn: Bool = false
    
    func onAppear() {
        // sjekk om bruker er logga inn
        if let username = UserDefaults.standard.object(forKey: AppStorageKeys.username.rawValue) as? String {
            isLoggedIn = true
            self.username = username
        }
        let keychain = KeychainSwift()
        if let password = keychain.get(AppStorageKeys.password.rawValue) {
            self.password = password
        }
        
        print(username as Any)
    }
    
    func createUserTapped() {
        let keychain = KeychainSwift()
        keychain.set(password, forKey: AppStorageKeys.password.rawValue)
        
        UserDefaults.standard.setValue(username, forKey: AppStorageKeys.username.rawValue)
        isLoggedIn = true
    }
    
    func deleteUserTapped() {
        UserDefaults.standard.removeObject(forKey: AppStorageKeys.username.rawValue)
        let keychain = KeychainSwift()
        
        password = ""
        keychain.delete(AppStorageKeys.password.rawValue)
        keychain.clear()
        
        username = nil
        isLoggedIn = false
    }
    
    
    var body: some View {
        VStack {
            Form {
                TextField("Brukernavn", text:
                            Binding(get: {
                    if let username = username {
                        return username
                    }
                    return ""
                }, set: { newValue, transaction in
                    username = newValue
                }))
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
                
                SecureField("Passord", text: $password)
                
                if isLoggedIn {
                    Button("Slett bruker") {
                        deleteUserTapped()
                    }.padding()
                }
                
            }.onAppear {
                onAppear()
            }
            Button("Opprett bruker") {
            
                createUserTapped()
            }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
