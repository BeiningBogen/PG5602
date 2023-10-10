//
//  ContentView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import SwiftUI
import KeychainSwift

enum UserLevel {
    case user
    case admin
    case employee
}

struct ProductListView: View {
    /// mac versjon?
    /// Content view?
    ///
    //    let products = ["Bukse", "T-skjorte", "Sko"]
    
    let apiClient = APIClient.demo
    
    init(products: [Product], isAdmin: Bool, shoppingCart: Binding<[Product]>) {
        self.products = products
        self.isAdmin = isAdmin
        self.shoppingCart = shoppingCart
    }
    var shoppingCart: Binding<[Product]>
    
    let isAdmin: Bool
    @State var products: [Product]
    
    @State var isPresentingAddProductView: Bool = false
    
    @State var isShowingAlert: Bool = false
    
    /// Textfield attributes
    @State var newProductName: String = ""
    @State var newProductPrice: String = ""
    @State var newProductDescription: String = ""
    
    @State var userLoginStatus: String = ""
    
    /// Called when view appears
    func onAppear() {
        print("on appear product list")
        
        // not admin
        if KeychainSwift().get(AppStorageKeys.password.rawValue) != nil,
           
            
            
            let username = UserDefaults().object(forKey: AppStorageKeys.username.rawValue) as? String
        {
            userLoginStatus = "Logget inn bruker: \(username)"
        } else {
            userLoginStatus = "Vennligst logg inn i appen"
        }
        Task {
            do {
                let products = try await apiClient.getProducts()
                
                DispatchQueue.main.async {
                    self.products = products
                }
                
            } catch let error {
                print(error)
            }
        }
    } // End onAppear
    
    func getWithClosures() {
        
        var urlRequest = URLRequest(url: URL.init(string: "https://raw.githubusercontent.com/BeiningBogen/PG5602/master/products.json")!)
        urlRequest.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            print(httpResponse?.statusCode)
            
            if let data = data {
                let stringResponse = String.init(data: data, encoding: .utf8)
                print(stringResponse)
                
                do {
                    let products = try JSONDecoder().decode([Product].self, from: data)
                    
                    
                    DispatchQueue.main.async {
                        self.products = products
                    }

                } catch let jsonError {
                    print(jsonError)
                }
                print(products)
                
            } else {
                print("No data received")
            }
            
        }
        task.resume()
    }
    
    
    func addProduct() {
        print("user still tapped button")
        if let productPrice = Int(newProductPrice) {
            let product = Product(name: newProductName, description: newProductDescription, price: productPrice, images: [])
            products.append(product)
        } else {
            print("feil format _\(newProductPrice)_")
        }
        
    }
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(products) { product in
                    HStack {
                        NavigationLink {
                            ProductDetailView(product: product)
                        } label: {
                            ListItemView(product: product)
                        } // NavigationLink
                        Spacer()
                        
                        if isAdmin == false {
                            UpdateProductView(
                                minusButtonTapped: {
                                    print("Minus button tapped")
                                    var hasRemoved = false
                                    shoppingCart.wrappedValue.removeAll { filteredProduct in
                                        if filteredProduct.name == product.name,
                                           hasRemoved == false {
                                            hasRemoved = true
                                            return true
                                        }
                                        return false
                                    }
                                    print(shoppingCart)
                                },
                                plusButtonTapped: {
                                    print("Plus button tapped")
                                    shoppingCart.wrappedValue.append(product)
                                })
                            .padding()
                            .frame(width: 140)
                        } else {
                        }
                        
                        
                        
                    } // HStack
                } // Foreach
                
                
                if isAdmin {
                    Button("Legg til produkt") {
                        isPresentingAddProductView = true
                    }// Button
                } else {
                    Text(userLoginStatus)

                }
            }.sheet(isPresented: $isPresentingAddProductView) {
                AddProductView() { product in
                    products.append(product)
                    isPresentingAddProductView = false
                }
            }
        }.onAppear {
            onAppear()
        }.onDisappear {
            
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView(products: Product.demoProducts, isAdmin: false, shoppingCart:
                
                .constant([])
        )
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
