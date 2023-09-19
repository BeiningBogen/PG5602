//
//  SettingsView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 18/09/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @State var isShowingOpenURLAlert = false
    
    @AppStorage(AppStorageKeys.username.rawValue) var username: String?
    
    func onAppear() { }
    
    var body: some View {
        NavigationView  {
            List {
                NavigationLink {
                    ProfileView()
                } label: {
                    HStack {
                        Text("Min profil")
                        Spacer()
                        if let username = username {
                            Text(username)
                                .foregroundColor(.gray)
                        } else {
                            Text("Du må logge inn").foregroundColor(.gray)
                        }
                    }
                }
                
                Button.init("Kontakt oss") {
                    isShowingOpenURLAlert = true
                }
            }
            .navigationTitle("Innstillinger")
        }.alert("Denne linken tar deg ut av appen", isPresented: $isShowingOpenURLAlert) {
                Button("OK") {
                    let url = URL.init(string: "https://kappahl.no/kontakt")!
                    UIApplication.shared.open(url)
                }
                Button("Avbryt") { }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
