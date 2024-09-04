//
//  Search.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 04/09/2024.
//

import SwiftUI
 
struct Contact {
    
    let name: String
}

struct SearchView: View {
    
    @State var textfieldText: String = "Jakke"
    
    var body: some View {
        
        VStack {
            
            search
            Divider()
           
           
            menu
            
            productList
            
            Spacer()
        }
    }
    
    var search: some View {
        TextField(text: $textfieldText) {
            Label("Søk", systemImage: "magnifyingglass")
        }
    }
    
    var menu: some View {
        HStack {
            Button(action: {
                print("trykka dame")
            }, label: {
                Text("Dame")
            })
        }
    }
    
    var productList: some View {
        List {
            Label("Nordisk stil", systemImage: "heart")
            Label("Nyheter", systemImage: "star")
            Label("Klær", systemImage: "figure.mixed.cardio")
        }
    }
}

#Preview {
    SearchView()
}
