//
//  ShoppingCart.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 18/09/2023.
//

import SwiftUI

struct ShoppingCart: View {
    
    let apiClient = APIClient.error(.stolenCard)
    
    @State var isShowingError: Bool = false
    
    @State var shownError: APIClientError?
//    {
//        didSet {
//            if let _ = shownError {
//                isShowingError = true
//            } else {
//                isShowingError = false
//            }
//        }
//    }
    
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
    
    func didTapPurchase() {
        Task {
            do {
                try await apiClient.purchaseProducts(shoppingCart.wrappedValue)
                shoppingCart.wrappedValue = []
//                shownError = nil
            } catch let error {
                print(error)
                
                shownError = error as! APIClientError
                isShowingError = true
            }
            
            
        }
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
                Button {
                    didTapPurchase()
                } label: {
                    Spacer()
                    Text("Kjøp \(shoppingCart.count) produkter")
                        .padding(.vertical)
                        .foregroundColor(.black)
                    Spacer()
                }
                .buttonStyle(.bordered)
                .padding()
                .tint(.green)

                
            }
            .navigationTitle("Handlekurv")
        }.sheet(isPresented: $isShowingError) {
            Text("Noe feil skjedde!")
            
            switch shownError {
                case .stolenCard:
                    WebpageView(url: URL.init(string: "https://politiet.no")!)
                case .notEnoughFunds:
                    Text("Du har ikke nok penger på kortet")
                case .statusCode(let statusCode):
                    Text("Prøv igjen eller kontakt support")
                case .failed(underlying: let error):
                    Text("Prøv igjen eller kontakt support")
                default:
                    Text("Prøv igjen eller kontakt support")
            }
            
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
