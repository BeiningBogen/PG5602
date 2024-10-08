//
//  BasketView.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 18/09/2024.
//

import SwiftUI

struct BasketView: View {
    
    @State var isPulsing = false
    
    var body: some View {
        VStack {
            Image(systemName: "cart")
                .resizable()
                .scaledToFit()
                .frame(width: 100) // 320
                .scaleEffect(isPulsing ? 1.2 : 1)
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: true)
                    ,
                    value: isPulsing)
            
            
            Text("No items in cart")
                .wordArt3D()
        }
        
        .rainbowBackground()
        .onAppear {
            isPulsing = true
        }
    }
}

#Preview {
    BasketView()
}
