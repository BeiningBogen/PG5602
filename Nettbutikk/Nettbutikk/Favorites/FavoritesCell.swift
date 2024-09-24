//
//  FavoritesCell.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 18/09/2024.
//

import SwiftUI

struct FavoritesCell: View {

    var product: Product

    var body: some View {
        HStack {
            VStack {
                Text(product.brand)
                Text(product.name)
                Text(CurrencyMapper().map(int: product.price))
                Text(product.fastDelivery ? "Fast delivery" : "Regular delivery")
            }
            VStack {
                Button("...") {
                    print("tapped ...")
                }
                Spacer()
                Button("Basket") {
                    print("tapped basket")
                }
                
            }
        }
    }
}

//#Preview {
//    FavoritesCell()
//}
