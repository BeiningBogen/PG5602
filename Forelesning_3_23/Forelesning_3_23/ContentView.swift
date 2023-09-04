//
//  ContentView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import SwiftUI

struct ContentView: View {
    /// mac versjon?
    /// Content view?
    ///
//    let products = ["Bukse", "T-skjorte", "Sko"]
    
    let products = [
        Product.init(name: "Bukse", description: "Grå, str 32", price: 500),
        Product.init(name: "T-skjorte", description: "hvit, medium. Laget av egyptisk bomull", price: 800)
    ]
    
//    let productDescriptions = ["Grå bukse, str medium"]
    
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
            } // List
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
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
