//
//  WordArt.swift
//  Forelesning_9
//
//  Created by Håkon Bogen on 24/09/2025.
//

import SwiftUI

struct WordArtModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 32, weight: .bold, design: .rounded))
            .foregroundStyle(
                LinearGradient(colors:
                                                [.red, .orange, .yellow, .green,.blue, .purple, .pink],
                               startPoint: .leading, endPoint: .trailing)
            ) // end foregroundstyle
            .shadow(color: .black, radius: 1, x: 3, y: 3)
            .textCase(.uppercase)
            
    }
    
}

extension View {
    
    func wordArtStyle() -> some View {
        self.modifier(WordArtModifier())
    }
}

#Preview  {
    VStack {
        Spacer()
        Text("Hello world with styling")
            .wordArtStyle()
        Spacer()
        Text("Hello world without styling")
//            .fontWeight(.bold)
        Spacer()
    }.padding()
}
