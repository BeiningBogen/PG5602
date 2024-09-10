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
    
    @State var textfieldText: String = ""
    
    var body: some View {
        
        VStack {
            
            search
            Divider()
           
           
            menu
            Divider()
            
            productList
            
            Spacer()
        }
    }
    
    var search: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField(text: $textfieldText) {
                Text("Søk")
            }
        }
        .padding(.leading)
        .padding(.bottom)
    }
    
    var menu: some View {
        HStack {
            Spacer()
            Button(action: {
                print("trykka dame")
            }, label: {
                Text("Dame")
            })
            
            Spacer()
            Button(action: {
                print("trykka herre")
            }, label: {
                Text("Herre")
            })
            Spacer()
        }
    }
    
    var productList: some View {
        List {
            Label("Nordisk stil", systemImage: "heart")
            Label("Nyheter", systemImage: "star")
            Label("Klær", systemImage: "figure.mixed.cardio")
        }
        .listStyle(.plain)
    }
}

#Preview {
    SearchView()
}
