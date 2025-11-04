//
//  SearchFieldDemoView.swift
//  Demo-Appstorage
//
//  Created by Håkon Bogen on 29/10/2025.
//


import SwiftUI

struct SearchFieldDemoView: View {
    
    @State private var searchText = ""
    @State private var isSearching = false
    
    let items = ["Apple", "Banana", "Cherry", "Fig", "Grape", "Kiwi", "Lemon", "Raspberry", "Salmonberry", "Orange", "Papaya", "Watermelon", "Strawberry", "Tangerine", "Quince"]
    
    var filteredItems: [String] {
        // Logikk som skal filterere arrayet items basert på searchText
        if searchText.isEmpty {
            return items
        } else {
            // filterer array basert på predikat
            return items.filter { $0.localizedCaseInsensitiveContains(searchText)
            }
        
//            return items.filter { item in
//                return item.localizedStandardContains(searchText)
//            }
        }
        
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(filteredItems, id: \.self) { item in
                        HStack {
                            Image(systemName: "leaf.fill")
                                .foregroundStyle(.green)
                            Text(item)
                        }
                    }
                }
                .searchable(text: $searchText, isPresented: $isSearching)
                .onSubmit(of: .search) {
                    print("Searching for: \(searchText)")
                }
                
                TextField("Search", text: $searchText)
                
                if !searchText.isEmpty {
                    Text("Found \(filteredItems.count) items")
                        .padding(.bottom, 50)
                        .foregroundStyle(.secondary)
                    
                    Button("Clear") {
                        searchText = ""
                        isSearching = false
                    }
                    .disabled(searchText.isEmpty)
                }
            }
            .navigationTitle("Fruit Search")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Clear") {
                        searchText = ""
                        isSearching = false
                    }
                    .disabled(searchText.isEmpty)
                }
            }
        }
    }
}

#Preview {
    SearchFieldDemoView()
}
