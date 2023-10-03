//
//  ShoppingCart.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 18/09/2023.
//

import SwiftUI

struct ShoppingCart: View {
    
    var shoppingCart: Binding<[Product]>
    @State var totalSum = 0
    
    init(shoppingCart: Binding<[Product]>) {
        self.shoppingCart = shoppingCart
       
    }
    
    func onAppear() {
        totalSum = 0
        for product in shoppingCart.wrappedValue {
            totalSum += product.price
        }
        print(totalSum)
    }
    
    var body: some View {
        NavigationView  {
            VStack {
                List {
                    ForEach(shoppingCart) { product in
                        HStack {
                            Text("\(product.wrappedValue.name)")
                            Spacer()
                            Text("\(product.wrappedValue.price) kr")
                        }
                    }
                    HStack {
                        Text("Totalt: ")
                        Spacer()
                        Text("\(totalSum) kr")
                        
                    }.bold()
                }
                
            }
            .navigationTitle("Handlekurv")
        }.onAppear {
            onAppear()
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
