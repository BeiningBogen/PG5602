//
//  ProductDetailView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
    // animation variables
    @State var scale: CGFloat = 1
    @State var rotationAngle: CGFloat = 0
    @State var imageOpacity: CGFloat = 1
    @State var imageBlur: CGFloat = 40
    @State var textPadding: CGFloat = 40
    
    init(product: Product) {
        self.product = product
    }
    
    var body: some View {
        VStack {
            HStack {
                Text(product.name)
                    .font(.largeTitle)
                    .bold()
                    .fontWeight(nil)
                    .padding(.top, textPadding)
                    .padding(.leading, 40)
                Spacer()
            } // HStack - Title
            
            Image("productImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
                .opacity(imageOpacity)
                .blur(radius: imageBlur)
            
            
            Text(product.description)
                .padding(
                    EdgeInsets(top: 50, leading: 0, bottom: 0, trailing: 0)
                )
            
            Spacer()
            Text("Før \(product.price + Int.random(in: 10...400)) kr ")
                .strikethrough()
                .padding(.top)
            
            Text("Nå \(product.price) kr ")
                .padding(.vertical)
            
            Button {
                // TODO: buy product
                
                withAnimation(.linear(duration: 2).repeatForever()) {
                    
                    scale = 1.2
                    rotationAngle = 100
                    imageOpacity = 0
                    textPadding = 400
                    
                }
//
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
//                    scale = 1
//                    rotationAngle -= 5
//                }
                print("bought \(product.name)")
                
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 100)
                        .foregroundColor(.yellow)
                    Text("Kjøp")
                }
            }
            .rotationEffect(
                Angle(degrees: rotationAngle)
            )
            .scaleEffect(scale)
//            .animation(.linear, value: scale)

        }
        .onAppear {
            withAnimation(.linear(duration: 1)) {
                imageBlur = 0
            }
        }
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: .init(name: "Tennissko", description: "hvite, str 45", price: 999, images: []))
    }
}
