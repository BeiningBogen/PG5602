//
//  ContentView.swift
//  Forelesning3
//
//  Created by Håkon Bogen on 02/09/2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack() {
            
            Spacer()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            
            Text("Hello, world!")
            Text("Lorem ipsum")
            
            HStack() {
                Spacer()
                Text("Start HStack")
                Spacer()
                Text("Slutt HStack")
                Spacer()
                    
            }.padding(.bottom)
            
            HStack {
                Image(systemName: "person")
                    
                Text("Ny HStack")
                    .foregroundStyle(.blue)
                Text("Enda en tekst")
                Spacer()
            }
            .font(.largeTitle)
            .foregroundStyle(.blue)
            
        
            
            Spacer()
        }
        .padding()
        .foregroundStyle(.red)
    }
}

#Preview {
    ContentView()
}
