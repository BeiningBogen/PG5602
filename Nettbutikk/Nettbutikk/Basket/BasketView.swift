//
//  BasketView.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 18/09/2024.
//

import SwiftUI

struct BasketView: View {
    
    @State var isRotating = false
    @State private var cartPosition = CGPoint.init(x: 200, y: 200)
    
    var body: some View {
        GeometryReader { geometry in
            
            
            VStack {
                Image(systemName: "cart")
                
                // Limit the size of the image and set it to min width 100, scaled to fit (aspect ratio kept)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                    
                
                // Pulse animation
                    .pulseEffect()
                
                // Rotation animation
                    .rotationEffect(isRotating ? .degrees(360) : .degrees(0))
                    .animation(
                        Animation.linear(duration: 0.6)
                            .repeatForever(autoreverses: false),
                        value: isRotating)
                
                    .position(cartPosition)

                
                Text("No items in cart")
                    .wordArt3D()
            }
            
            .rainbowBackground()
            .onAppear {
                isRotating = true
            }
            .onTapGesture { location in
                print(location)
                
                withAnimation(Animation.spring) {
                    cartPosition = location
                    
                }
                
            }
        }
    }
}

#Preview {
    BasketView()
}

struct PulsingEffect: ViewModifier {
    
    //    init(isPulsing: Binding<Bool>, duration: Double = 0.6)
    
    @State private var isPulsing = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isPulsing ? 1.5 : 0.6)
            .animation(
                Animation.easeInOut(duration: 0.6)
                    .repeatForever(autoreverses: true)
                
                ,value: isPulsing)
            .onAppear {
                isPulsing = true
            }
    }
}

extension View {
    func pulseEffect() -> some View {
        modifier(PulsingEffect())
    }
}
