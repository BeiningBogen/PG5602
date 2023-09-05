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
        print(product)
        self.product = product
    }
    
    var body: some View {
        VStack {
            Text(product.name)
            Text(product.description)
        }.foregroundColor(.red)
        
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: .init(name: "Tennissko", description: "hvite, str 45", price: 999))
    }
}
