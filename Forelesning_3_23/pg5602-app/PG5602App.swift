//
//  Forelesning_3_23App.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 04/09/2023.
//

import SwiftUI

@main
struct PG5602App: App {
    
    @State var numberOfItemsInShoppingCart: Int = 3
    
    @State var shoppingCart = [Product]()
    
    @StateObject var dataController = DataController()
    
    /// Read from disk
    func onAppear() {
        
        let fileManager = FileManager.default
        do {
            let fileURL = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
                .appendingPathComponent("data.json")
            
            let data = try Data.init(contentsOf: fileURL)
            let decoder = JSONDecoder()
            self.shoppingCart = try decoder.decode([Product].self, from: data)
            print(data)
            
            
            
          
            
            /// NB flere måter å skrive ting på i Swift:
//            Array<String>  ==   [String]
//            Dictionary<String, Any>  == [String : Any]
//            () == Void
            
            
            
        } catch let error {
            print(error)
        }
        
    }
    /// Save to disk
    func shoppingCartOnAppear() {
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(shoppingCart)
            let fileManager = FileManager.default
            // hent ut path til documents
            
            let fileURL = try fileManager.url(for: .documentDirectory,
                                                      in: .userDomainMask,
                                                      appropriateFor: nil,
                                                      create: false)
                .appendingPathComponent("data.json")
            try data.write(to: fileURL)
            
            
        } catch let error {
            print(error)
        }
        
    }
    
    var body: some Scene {
        WindowGroup {
            TabView {
                ProductListView(products: Product.demoProducts, isAdmin: true, shoppingCart: $shoppingCart)
//                    .badge(99)
                    .tabItem {
                        Label("Produkter", systemImage: "tray.and.arrow.up.fill")
                    }
                
                ShoppingCart(shoppingCart: $shoppingCart)
                    .badge($shoppingCart.count)
                    .tabItem {
                        Label("Handlekurv", systemImage: "tray.and.arrow.up.fill")
                    }.onAppear {
                        shoppingCartOnAppear()
                    }
                
                StoreView()
                    .tabItem {
                        Label("Butikker", systemImage: "dollarsign")
                    }
                   
                
                SettingsView()
                    .tabItem {
                        Label.init("Innstillinger", systemImage:    "pencil")
                    }
                
            }.onAppear {
                onAppear()
            }.environment(\.managedObjectContext,       dataController.container.viewContext)
            
        }
    }
}
