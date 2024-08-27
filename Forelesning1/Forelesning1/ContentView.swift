//
//  ContentView.swift
//  Forelesning1
//
//  Created by Håkon Bogen on 27/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .center) {
           
            Spacer()
            
            
            HStack {
                
                Spacer()
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                
                ZStack {
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 100, height: 100)
                        .offset(CGSize(width: 10.0, height: 10.0))
                        
                    
                    Rectangle()
                        .frame(width: 100, height: 100)
                        .foregroundColor(.red)

                    Text("Hello, world!")
                        .foregroundStyle(.white)

                    Text("Second text")
                        .foregroundStyle(.white)
                }
                
                
            }
            .padding(.trailing)
            
            Spacer()
                .padding(.bottom)
            
        }
    }
}

#Preview {
    ContentView()
}
