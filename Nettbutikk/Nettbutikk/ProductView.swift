//
//  ProductView.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 24/09/2024.
//

import SwiftUI

struct MyProduct: Decodable, Identifiable, Hashable {
    
    var id: Self {
        return self
    }
    
    let name: String
    let price: Float
    
}

struct ProductView: View {
    
    @State var selectedClothingType: ClothingType
    @State var products: [MyProduct] = []
    
    @State var selectedProduct: MyProduct?
    
    init(selectedClothingType: ClothingType) {
        self.selectedClothingType = selectedClothingType
    }
    
    var body: some View {
        VStack {
            if let selectedProduct {
                Text(selectedProduct.name)
                Text(selectedProduct.price.description)
            } else {
                Text("Ikke valgt produkt")
            }
            
            Text("\(selectedClothingType.rawValue)")
            ScrollView {
                HStack {
                    ForEach(products) { product in
                        Button {
                            self.selectedProduct = product
                        } label: {
                            ZStack {
                                Color.yellow
                                Text(product.name)
                            }
                        }

                        
                    }
                }
            }
            
        }.onAppear {
            Task {
                await getProducts()
            }
        }
        
    }
    
    func getProducts() async {
        //        let session = URLSession()
        do {
            let url = selectedClothingType.url
            
            let urlRequest = URLRequest.standard(url: url)

            
            let response = try await URLSession.shared.data(for: urlRequest)
            
            let data = response.0
            
            print(String(data: data, encoding: .utf8))
            
            let products = try JSONDecoder().decode([MyProduct].self, from: data)
            print(products)
            
            self.products = products
            
        } catch {
            print(error)
        }
    }
    
}



#Preview {
    ProductView(selectedClothingType: .allCases.randomElement()!)
}
