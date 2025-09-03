//
//  ContentView.swift
//  ActionsTest
//
//  Created by Håkon Bogen on 03/09/2025.
//

import SwiftUI

func buttonTapped() -> Void {
    print("Button tapped")
}

struct ContentView: View {
    
    @State private var buttonText = "Was button tapped?"
    
    @State private var name = ""
    
    @State private var counter = 0
    
    private func didTapPlusButton() {
        counter += 1
    }
    
    private func didTapMinusButton() {
        counter -= 1
    }
    
    var body: some View {
        VStack {
            TextField("Your name", text: $name)
                .textFieldStyle(.roundedBorder)
                .font(.headline)
            
            Text(buttonText)
                .font(.largeTitle)
            
            Button("Logg inn") {
                buttonText = "Velkommen \(name)"
            }
            
            HStack {
                Button {
                    didTapPlusButton()
                } label: {
                    HStack {
                        Image(systemName: "plus")
                    }
                }
                
                Text("Counter: \(counter)")
                
                Button {
                    didTapMinusButton()
                } label:  {
                    Image(systemName: "minus")
                }
            }

            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
