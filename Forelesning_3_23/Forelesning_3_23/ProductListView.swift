//
//  ContentView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import SwiftUI

struct ProductListView: View {
    /// mac versjon?
    /// Content view?
    ///
//    let products = ["Bukse", "T-skjorte", "Sko"]
    
    init(products: [Product]) {
        self.products = products
    }
    
    
    @State var products: [Product]
    
//    @Published
//    @ObservedObject
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(products) { product in
                    NavigationLink {
                        ProductDetailView(product: product)
                    } label: {
                        ListItemView(product: product)
                    }
                } // Foreach
                Button("Legg til produkt") {
                    let newProduct = Product.init(name: "Sokker", description: "small, gule", price: 230)
                    print(products.count) // printer 2
                    products.append(newProduct)
                }
                
                
            } // List
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(products: Product.demoProducts)
    }
}

struct ListItemView: View {
    
    let product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(product.name)")
            Text(product.description)
                .foregroundColor(.gray)
        }.padding()
            .foregroundColor(.brown)
    }
}
