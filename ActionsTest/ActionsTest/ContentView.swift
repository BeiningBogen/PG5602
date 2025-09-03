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
    
    @State private var selectedColor = Color.blue
    
    @State private var isShowingColorPicker = false
    
    @State private var volume: Double = 50
    
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
            
            Divider()
                .padding(.top)
            HStack {
                Rectangle()
                    .fill(selectedColor)
                    .frame(width: 50, height: 50)
                
                Button("Change color") {
                    isShowingColorPicker = true
                }
            }
            Divider()
                .padding(.top)
            
            Circle()
                .fill(.red)
                .frame(width: CGFloat(volume), height: CGFloat(volume))
                .animation(.spring(), value: volume)
            
            Text("Volume: \(Int(volume))%")
            
            Slider(value: $volume, in: 0...100)
        }
        .padding()
        .sheet(isPresented: $isShowingColorPicker) {
            Text("Pick a color")
            ColorPicker("Farge", selection: $selectedColor)
                .padding()
        }
    }
}

#Preview {
    ContentView()
}
