//
//  UserProfileView.swift
//  StateDemo
//
//  Created by Håkon Bogen on 04/11/2025.
//
import SwiftUI
import Foundation
import Combine

struct UserProfileView: View {
    // "Globalt" objekt som brukes av flere views
    @EnvironmentObject var userManager: UserDataManager
    
    // Lokal state for kun dette viewet!
    @State private var newName = ""
    @State private var newAge = ""
    @State private var isShowingEditSheet = false

    var body: some View {
        VStack(alignment: .leading, spacing: 10)  {
            Text("Brukerprofil")
                .font(.headline)
                .foregroundStyle(.blue)
            
            Text("Navn \(userManager.username)")
            Text("Alder: \(userManager.userAge)")
            Text("Status: \(userManager.isLoggedIn ? "Innlogget" : "Logget ut")")
            
            HStack {
                Button(userManager.isLoggedIn ? "Logg ut" : "Logg inn") {
                    // Refactor dette inn i userManager?
                    if userManager.isLoggedIn {
                        userManager.logout()
                    } else {
                        userManager.login()
                    }
                }
                .buttonStyle(.borderedProminent)
                Button("Rediger profil") {
                    newName = userManager.username
                    newAge = String(userManager.userAge)
                    isShowingEditSheet = true
                }
                .buttonStyle(.bordered)
            }
        }
        .padding()
        .backgroundStyle(Color.gray.opacity(0.1))
        .cornerRadius(8)
        .sheet(isPresented: $isShowingEditSheet) {
            // Burde være et eget View i en egen fil!
            NavigationView {
                Form {
                    TextField("Navn", text: $newName)
                    TextField("Alder", text: $newAge)
                        .keyboardType(.numberPad)
                }
                .navigationTitle("Rediger profil")
                .navigationBarItems(leading: Button("Avbryt") {
                    isShowingEditSheet = false
                }, trailing: Button("Lagre") {
                    if let age = Int(newAge) {
                        userManager.updateUserInfo(name: newName, age: age)
                    }
                    isShowingEditSheet = false
                })
            }
        }
        
    }
}
#Preview {
    UserProfileView()
        .environmentObject(UserDataManager())
}
