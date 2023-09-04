//
//  ContentView.swift
//  TestForelesning1_23
//
//  Created by Håkon Bogen on 28/08/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        VStack {
            Image(systemName: "globe").aspectRatio(contentMode: .fit)
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
            
            HStack {
                
                Color(UIColor.blue)
                
                Text("Hello, Norway!")
                    .font(.largeTitle)
//                    .padding(EdgeInsets(top: 40, leading: 50, bottom: 0, trailing: 0))
                
            }
            
            Text("Welcome to the app")
                .font(.system(size: 21))
                .foregroundColor(
                    Color.blue
                        .opacity(0.8)
                )
            
            
            Spacer.init(minLength: 10)
            HStack {
                Spacer()
                    .padding()
                
                Text("Hello 4")
                Spacer()
                VStack {
                    Text("Hello 5")
                    Text("Hello 6")
                    Text("Hello 7")
                    
                   
                } // VStack
                .font(.system(size: 30))
                Spacer()
            } // HStack
            .foregroundColor(.green)
            
//            .padding(
//                EdgeInsets(top: 100,
//                           leading: 140,
//                           bottom: 0,
//                           trailing: 10
//                          )
//            )
            // HStack
//            .padding()
        } // VStack
        .font(.system(size: 30))
//        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
//            .preferredColorScheme(.dark)
    }
}
