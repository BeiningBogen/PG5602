//
//  BasketView.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 18/09/2024.
//

import SwiftUI
import SwiftData

struct ProductList: View {
    @State var products: [Product]
    init(products: [Product]) {
        self.products = products
    }
    
    var body: some View  {
        List {
            
        }
    }
}

struct BasketView: View {
    
    @State var isRotating = false
    @State private var cartPosition = CGPoint.init(x: 200, y: 200)
    
    // Select * from PRODUCTS
    // Hente alle produkter, sortert på navn
    @Query(sort: \Product.name) var products: [Product]
    
    // Referanse til databasen vår
    @Environment(\.modelContext) var modelContext
    
    var uniqueProducts: [Product] {
//        // Lag et Set, som kan inneholde produkter
//        var seenProducts: Set<Product> = []
//        
//        // Går gjennom alle mulige produkter i DB
//        for product in products {
//            // Legg til hvert produkt i Set
//            seenProducts.insert(product)
//        }
//        // Konverter Set til Array
//        return seenProducts.map { product in
//            return product
//        }
        
        // Lag et Set med alle produkt-IDer
        var seenIds: Set<Int> = []
        /// Filtrer alle produkter basert på logikken i closuren:
        return products.filter { product in
            // Hvis de sette idene inneholder produktet vi er på nå:
            if seenIds.contains(product.id) {
                // fjern produktet fra arrayet
                return false
            } else {
                // Legg til i Set over "identifiserte id-er"
                seenIds.insert(product.id)
                // Legg til i Arrayet vi returnerer fra funksjonen (filter)
                return true
            }
        }
    }
    
    
    var body: some View {
        
        if products.isEmpty {
            emptyState
        } else {
            productList
        }
        
    }
    
//    func didIncrement() {
//        
//    }
    
    var productList: some View {
        List {
            ForEach(uniqueProducts) { product in
                HStack {
                    Text(product.name)
                    
                    Stepper("", onIncrement: {
                        product.storeInDatabase(context: modelContext)
                    }, onDecrement: {
                        
                    })
                }
                
            }
        }
    }
    
    var emptyState: some View {
        
        
        GeometryReader { geometry in
            VStack {
                Image(systemName: "cart")
                
                // Limit the size of the image and set it to min width 100, scaled to fit (aspect ratio kept)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100)
                
                
                // Pulse animation
                    .pulseEffect()
                
                // Rotation animation
                    .rotationEffect(isRotating ? .degrees(360) : .degrees(0))
                    .animation(
                        Animation.linear(duration: 0.6)
                            .repeatForever(autoreverses: false),
                        value: isRotating)
                
                    .position(cartPosition)
                
                
                Text("No items in cart")
                    .wordArt3D()
            }
            
            .rainbowBackground()
            .onAppear {
                isRotating = true
            }
            .onTapGesture { location in
                print(location)
                
                withAnimation(Animation.spring) {
                    cartPosition = location
                    
                }
            }
        }
    }
    
}

#Preview {
    BasketView()
        .modelContainer(sharedModelContainer)
}

struct PulsingEffect: ViewModifier {
    
    //    init(isPulsing: Binding<Bool>, duration: Double = 0.6)
    
    @State private var isPulsing = false
    
    func body(content: Content) -> some View {
        content
            .scaleEffect(isPulsing ? 1.5 : 0.6)
            .animation(
                Animation.easeInOut(duration: 0.6)
                    .repeatForever(autoreverses: true)
                
                ,value: isPulsing)
            .onAppear {
                isPulsing = true
            }
    }
}

extension View {
    func pulseEffect() -> some View {
        modifier(PulsingEffect())
    }
}
