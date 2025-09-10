//
//  ContentView.swift
//  Lecture5-Forms
//
//  Created by Håkon Bogen on 10/09/2025.
//

import SwiftUI

struct Country: Hashable {
    let name: String
    let flag: String
    
    static let countries = [
        Country(name: "Norge", flag: "🇳🇴"),
        Country(name: "USA", flag: "🇺🇸"),
        Country(name: "Frankrike", flag: "🇫🇷")
        
    ]
}

struct Person {
    
    let name: String
    let email: String
    let phone: String
    let country: Country
    let age: Int
    let isSubscribedToNewsLetter: Bool
    
}

struct RegistrationView: View {
    
    // Personlig informasjon
    @State private var name = ""
    @State private var email = ""
    @State private var phone = ""
    
    // Detaljer
    @State private var selectedCountry = Country(name: "Norge", flag: "🇳🇴")
    
    @State private var selectedAge = 10
    
    // Innstilling
    @State private var isSubscribedToNewsLetter = false
    
    let countries = [
        Country(name: "Norge", flag: "🇳🇴"),
        Country(name: "USA", flag: "🇺🇸"),
        Country(name: "Frankrike", flag: "🇫🇷")
        
    ]
    
    func headerContent() -> some View {
        TextField("Navn", text: $name)
        
    }
    
    func registerUser() {
        
    }
    
    func didTapRegisterUserButton() {
        let person = Person(name: name, email: email, phone: phone, country: selectedCountry, age: selectedAge, isSubscribedToNewsLetter: isSubscribedToNewsLetter)
        
        print("did tap register user: \(person)")
    }
    
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Personlig informasjon")) {
                    TextField("Navn", text: $name)
                        .keyboardType(.default)
                    
                    TextField("E-post", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                        .autocapitalization(.none)
                    
                    TextField("Telefon", text: $phone)
                        .keyboardType(.phonePad)
                    
                } // End Section Personlig info
                Section("Detaljer") {
                    Picker("Land", selection: $selectedCountry) {
                        ForEach(countries, id: \.self) { country in
                            Text("\(country.flag) \(country.name)")
                        }
                    }.pickerStyle(.wheel)
                    
                    Stepper("Alder \(selectedAge)", value: $selectedAge, in: 10...120)
                    
                } // End Section Detaljer
                Section(header: Text("Innstillinger")) {
                    Toggle("Motta nyhetsbrev \(isSubscribedToNewsLetter)", isOn: $isSubscribedToNewsLetter)
                    
                    Section {
                        Button("Registrer bruker") {
                            registerUser()
                            didTapRegisterUserButton()
                            
                        }.disabled((!name.isEmpty || !email.isEmpty) && isSubscribedToNewsLetter == true)
                    }
                }
            } // End Form
            
            VStack {
                
            }
            .padding()
        }
    }
}

#Preview {
    RegistrationView()
}
