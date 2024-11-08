//
//  ProductView.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 24/09/2024.
//

import SwiftUI
import SwiftData


struct ProductView: View {
    
    // Vi lager en lokal attributt fra en Environment-variabel
    @Environment(\.modelContext) var modelContext
    
    @State var selectedClothingType: ClothingType
    @State var products: [Product] = []
    
    @State var selectedProduct: Product?
    
    @State var isShowingError = false
    
    @State var amountInCart = 0
    
    init(selectedClothingType: ClothingType) {
        self.selectedClothingType = selectedClothingType
    }
    
    func didTap(product: Product) {
        
        self.selectedProduct = product
        
        amountInCart = Product.allStoredProducts(withId: product.id, inContext: modelContext)
            .count
    }
    
    func suppliersView(product: Product) -> some View {
        VStack(alignment: .leading) {
            
            Text("Leverandørinfo:")
                .padding(.bottom)
            
            ForEach(product.suppliers) { supplier in
                HStack {
                    Text(supplier.name)
                    Spacer()
                    Text(supplier.country)
//                    Image(UIImage(data: ).cgImage, scale: 1, label: "")
                    
                    AsyncImage(url: supplier.flagURL) { image in
                        image.resizable()
                            .frame(width: 30, height: 30)
                        
                    } placeholder: {
//                        UIImage
                   
                        Color.red
                            .border(.gray)
                            .frame(width: 30, height: 30)
                    }
                        
                    Spacer()
                    Text(supplier.contactInfo)
                }.font(.footnote)
                
            }
        }.padding(20)
            .background {
                Color.gray
                    .opacity(0.4)
                    .cornerRadius(20)
        }
        // Text("\(product.suppliers.first?.name)")
    }
    
    var body: some View {
        VStack {
            Group {
                if let selectedProduct {
                    
                    Text(selectedProduct.name)
                    Text(selectedProduct.price.description)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    
                    Text("I handlekurven: \(amountInCart)")
                    
                    Stepper("Legg til i handlekurv") {
                        
                        selectedProduct.storeInDatabase(context: modelContext)
                        
                        amountInCart = Product.allStoredProducts(withId: selectedProduct.id, inContext: modelContext)
                            .count
                        
                    } onDecrement: {
                        
                        
                        // Select * from Products where id == selectedProduct.id
                        selectedProduct.deleteFromDatabase(context: modelContext)
                        
                        let result = Product.allStoredProducts(withId: selectedProduct.id, inContext: modelContext)
                        amountInCart = result.count
                        print("Trykka fjern produkt")
                    }
                    
                    suppliersView(product: selectedProduct)

                } else {
                    Text("Ikke valgt produkt")
                }
            }
            .padding()
            .font(.title2)
            
            
            Text("\(selectedClothingType.rawValue)")
            Spacer()
            ScrollView(.horizontal) {
                HStack {
                    ForEach(products) { product in
                        
                        Button {
                            didTap(product: product)
                        } label: {
                            ZStack {
//                                if selectedProduct?.id == product.id {
//                                    Color.yellow.opacity(0.5)
//                                } else {
//                                    Color.yellow
//                                }
//                                Image
                                
                                AsyncImage(url: product.imageURL) { image in
                                    
                                    image.resizable()
                                        .frame(width: 200, height: 200)
                                        .clipShape(.rect(cornerRadius: 20))
                                        .overlay {
                                            if selectedProduct?.id == product.id {
                                                RoundedRectangle(cornerRadius: 20)
                                                    .stroke(Color.green, lineWidth: 5)
                                            }
                                        }
                                    
                                } placeholder: {
                                    ZStack {
                                        Color.gray
                                            .frame(width: 200, height: 200)
                                            .clipShape(.rect(cornerRadius: 20))
                                        ProgressView()
                                    }
                                    
                                }

                                
                                VStack {
                                    Spacer()
                                    Text(product.name)
                                        .padding(.bottom)
                                        .font(.title3)
                                }
                            }
                            .frame(height: UIScreen.main.bounds.height * 0.4)
                        }
                    }
                }
            }
        }.onAppear {
            Task {
                await getProducts()
            }
        }
        .sheet(isPresented: $isShowingError) {
            Text("Something wrong happened")
                .onAppear {
                    print("did show error")
                    return ()
                }
            //            print("did show error")
            // () == Void
            //            return
        }
        
    }
    
    func getProducts() async {
        //        let session = URLSession()
        do {
            let url = selectedClothingType.url
            
            let urlRequest = URLRequest.standard(url: url)
            
            
            let response = try await URLSession.shared.data(for: urlRequest)
            
            let data = response.0
            data.prettyPrint()
            
            let products = try JSONDecoder().decode([Product].self, from: data)
            print(products)
            
            self.products = products
            selectedProduct = products.first
            
            // Oppdater handlekurven med riktig antall produkter
            amountInCart = Product.allStoredProducts(withId: selectedProduct?.id, inContext: modelContext).count
            
           
            //            selectedProduct = products.first
            
        } catch {
            isShowingError = true
            //            Sentry.logError(error)
            print(error)
        }
    }
    
}



#Preview {
    ProductView(selectedClothingType: .klær)
    // Sett riktig database i preview også
        .modelContainer(sharedModelContainer)
}
