//
//  ProfileView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 19/09/2023.
//

import SwiftUI

enum AppStorageKeys: String {
    case username
}

struct ProfileView: View {
    
//    @AppStorage(AppStorageKeys.username.rawValue) var username: String?
    
    @State var username: String?
    
    @State var isLoggedIn: Bool = false
    
    func onAppear() {
        // sjekk om bruker er logga inn
        if let username = UserDefaults.standard.object(forKey: AppStorageKeys.username.rawValue) as? String {
            isLoggedIn = true
            self.username = username
        }
        print(username as Any)
    }
    
    func createUserTapped() {
        UserDefaults.standard.setValue(username, forKey: AppStorageKeys.username.rawValue)
        isLoggedIn = true
    }
    
    func deleteUserTapped() {
        UserDefaults.standard.removeObject(forKey: AppStorageKeys.username.rawValue)
        username = nil
        isLoggedIn = false
    }
    
    
    var body: some View {
        VStack {
            TextField("Brukernavn", text:
                        Binding(get: {
                if let username = username {
                    return username
                }
                return ""
            }, set: { newValue, transaction in
                username = newValue
            }))
            .border(.black, width: 1)
            .padding(.horizontal, 50)
            .textFieldStyle(.roundedBorder)
            
            Button("Opprett bruker") {
                createUserTapped()
            }
            
            if isLoggedIn {
                Button("Slett bruker") {
                    deleteUserTapped()
                }.padding()
            }
        }.onAppear {
            onAppear()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
