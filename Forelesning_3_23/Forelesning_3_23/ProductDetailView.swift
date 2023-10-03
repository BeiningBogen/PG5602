//
//  ProductDetailView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    
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
                    .padding(.top, 40)
                    .padding(.leading, 40)
                Spacer()
            } // HStack - Title
            
            Image("productImage")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 200)
            
            
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
                print("bought \(product.name)")
            } label: {
                ZStack {
                    Circle()
                        .frame(width: 100)
                        .foregroundColor(.yellow)
                    Text("Kjøp")
                }
            }

        }
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: .init(name: "Tennissko", description: "hvite, str 45", price: 999, images: []))
    }
}
