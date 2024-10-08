//
//  View+Backgrounds.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 08/10/2024.
//

import SwiftUI

struct RainbowBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(gradient:
                                Gradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing
                              )
            )
//            .edgesIgnoringSafeArea(.all)
    }
}

extension View {
    
    func rainbowBackground() -> some View {
        self.modifier(RainbowBackground())
    }
}

#Preview  {
    VStack {
        Text("Hello world")
//            .measure()
    }.rainbowBackground()
//    .measure()

}
