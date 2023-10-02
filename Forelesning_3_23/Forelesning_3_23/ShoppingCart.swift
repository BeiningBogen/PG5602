//
//  ShoppingCart.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 18/09/2023.
//

import SwiftUI

struct ShoppingCart: View {
    
    var shoppingCart: Binding<[Product]>
    init(shoppingCart: Binding<[Product]>) {
        self.shoppingCart = shoppingCart
    }
    
    var body: some View {
        NavigationView  {
            List {
                ForEach(shoppingCart) { product in
                    Text("\(product.wrappedValue.name) \(product.wrappedValue.price) kr")
                }
            }
            .navigationTitle("Handlekurv")
        }
    }
}

struct ShoppingCart_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCart(shoppingCart: .constant(
            [
                Product(name: "Sokker", description: "Gule", price: 500, images: [])
            ]
        )
        )
    }
}
