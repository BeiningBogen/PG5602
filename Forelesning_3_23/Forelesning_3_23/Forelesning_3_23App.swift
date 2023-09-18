//
//  Forelesning_3_23App.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import SwiftUI

@main
struct Forelesning_3_23App: App {
    
    @State var numberOfItemsInShoppingCart: Int = 3
    
    @State var shoppingCart = [Product]()
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ProductListView(products: Product.demoProducts, isAdmin: false, shoppingCart: $shoppingCart)
//                    .badge(99)
                    .tabItem {
                        Label("Produkter", systemImage: "tray.and.arrow.up.fill")
                    }
                
                ShoppingCart()
                    .badge($shoppingCart.count)
                    .tabItem {
                        Label("Handlekurv", systemImage: "tray.and.arrow.up.fill")
                    }
                
                SettingsView()
                    .tabItem {
                        Label.init("Innstillinger", systemImage: "pencil")
                    }
                
            }
            
        }
    }
}
