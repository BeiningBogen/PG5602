//
//  Search.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 04/09/2024.
//

import SwiftUI
 
struct ListElement: Identifiable, Equatable, Hashable {
    
    public var id: Self { return self }
    
    let name: String
    let systemImageName: String
    
}

enum ClothingCategory: String, CaseIterable, Identifiable {
    
    var id: String { return rawValue }
    
    
    case dame = "Dame"
    case herre = "Herre"
    case baby = "Baby"
    
}

struct SearchView: View {
    
    @State var textfieldText: String = ""
    
    @State var listElements = [ListElement]()
    
    @State var selectedClothingCategory: ClothingCategory = .dame {
        didSet {
            print(selectedClothingCategory)
        }
    }
    
    func didTap(clothingCategory: ClothingCategory) {
        selectedClothingCategory = clothingCategory
    }
    
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
            
            ForEach(ClothingCategory.allCases) { clothingCategory in
                Button(action: {
                    didTap(clothingCategory: clothingCategory)
                }, label: {
//                    if selectedClothingCategory == clothingCategory {
//                        Text("\(clothingCategory.rawValue)")
//                            .fontWeight(.bold)
//                    } else {
//                        Text("\(clothingCategory.rawValue)")
//                    }
                    
                    
                    Text("\(clothingCategory.rawValue)")
                        .fontWeight(
                            selectedClothingCategory == clothingCategory ? .bold : .regular
                        )
                        .font(1 * 1 == 1  ? .body : .largeTitle)
                    
                })
                
                Spacer()
            }
           
        }
    }
    
    var productList: some View {
        List {
            ForEach(listElements) { listElement in
                
            }
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
