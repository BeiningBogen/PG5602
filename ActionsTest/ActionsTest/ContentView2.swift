//
//  ContentView2.swift
//  ActionsTest
//
//  Created by Håkon Bogen on 03/09/2025.
//

import SwiftUI

struct ContentView2: View {
    
    @State var isShowingAlert = false
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            Button("Show alert") {
                isShowingAlert = true
            }
        }.alert("Advarsel! Klarte ikke logge inn", isPresented: $isShowingAlert) {
            
            Button("Avbryt", role: .cancel) {
                
            }
            Button("Prøv igjen") {
                // kall web request igjea
            }
        }
    }
}

#Preview {
    ContentView2()
}
