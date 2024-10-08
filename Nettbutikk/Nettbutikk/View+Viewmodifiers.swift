//
//  View+Viewmodifiers.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 02/10/2024.
//

import SwiftUI

//Text("hello world")
//    .rainbow
//Button("")
//    .rainbowStyle()
// VStack

struct RainbowModifier: ViewModifier {
    
    private let colors: [Color]
    
    init(colors: [Color]) {
        self.colors = colors
    }
    
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundStyle(LinearGradient(colors: colors, startPoint: .leading, endPoint: .trailing))

    }
}

extension View {
    func rainbowStyle(colors: [Color] = [.red, .orange, .yellow, .green, .blue, .purple]) -> some View {
        return self.modifier(RainbowModifier(colors: colors))
    }
    
}

struct WordArt3DModifier: ViewModifier {
    
    let baseColor: Color
    let shadowOffset: CGFloat
    
    func body(content: Content) -> some View {
        
        ZStack {
            content
                .offset(x: shadowOffset * 2, y: shadowOffset * 2)
                .foregroundStyle(baseColor)
            
            content
                .offset(x: shadowOffset, y: shadowOffset)
                .foregroundStyle(baseColor)
            
            content
                .foregroundStyle(.white)
        
        }
        
    }
}

extension View {
    
    func wordArt3D(baseColor: Color = .black,
                   shadowOffset: CGFloat = 1.5
    ) -> some View {
        self.modifier(WordArt3DModifier(baseColor: baseColor, shadowOffset: shadowOffset))
    }
}

extension View {
    
    func measure() -> some View {
        return overlay {
            
            GeometryReader { geometry in
                Rectangle()
                    .stroke(.pink, style:
                                StrokeStyle(lineWidth: 1, dash: [3,2])
                    )
                    .overlay(alignment: .topLeading) {
                        Text(
                    """
                     \(Double(geometry.size.width).formatted(.number.precision(.fractionLength(2))))
            
                     \(Double(geometry.size.height).formatted(.number.precision(.fractionLength(2))))
                
""")
                        .font(.system(size: 10))
                        .kerning(-0.5 )
                        .padding(.vertical, 1)
                        .padding(.horizontal, 1)
                        
                    }
            }
            
        }
    }
}

#Preview {
    ZStack {
        Color.blue
            .ignoresSafeArea()
        
        VStack {
            Text("Word art 3D!")
                .font(.system(size: 70))
                .wordArt3D(baseColor: .gray, shadowOffset: 3)
                .measure()
            
            Text("Rainbow ")
                .rainbowStyle()
            
            Text("Custom colors of your choice")
                .rainbowStyle(colors: [.blue, .black, .red])
                .measure()
        }
    }
}
