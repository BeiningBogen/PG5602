//
//  ContentView.swift
//  Forelesning8
//
//  Created by Håkon Bogen on 17/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = false
    
    @State private var errorMessage: String? = nil
    
    @State private var users: [User] = []
    
    func getUsers() async {
        isLoading = true
        errorMessage = nil
        
        do  {
            let url = URL(string: "https://jsonplaceholder.typicode.com/users")!
            let (data, response) = try await URLSession.shared.data(from: url)
            let users = try JSONDecoder().decode([User].self, from: data)
            self.users = users
            isLoading = false
            
        } catch {
            errorMessage = "Noe gikk galt! \(error.localizedDescription)"
            isLoading = false
        }
    }
    
    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Henter brukere")
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
            } else {
                List(users) { user in
                    Text(user.name)
                }
            }
        } // End VStack
//        .task {
//            await getUsers()
//        }
        .onAppear {
            Task {
                await getUsers()
            }
        }
    }
}

#Preview {
    ContentView()
}
