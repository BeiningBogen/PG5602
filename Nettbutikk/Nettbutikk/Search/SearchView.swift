//
//  Search.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 04/09/2024.
//

import SwiftUI
 
enum ClothingCategory: String, CaseIterable, Identifiable, Codable {

    var id: String { return rawValue }
    
    
    case dame = "Dame"
    case herre = "Herre"
    case baby = "Baby"
    
}

struct SearchView: View {
    
    @State var textfieldText: String = ""
    
    @State var searchCategories = SearchCategory.defaultCategories

    @State var selectedClothingCategory: ClothingCategory = .dame {
        didSet {
            print(selectedClothingCategory)
        }
    }

    @State var searchSuggestions = [String]()

    @State var isLoading = false

    private let userSettingsRepository = UserSettingsRepository()

    func didTap(clothingCategory: ClothingCategory) {
        selectedClothingCategory = clothingCategory
        switch selectedClothingCategory {
        case .dame:
            searchCategories = SearchCategory.defaultCategories
        case .herre:
            searchCategories = SearchCategory.defaultCategories
        case .baby:
            searchCategories = SearchCategory.barnCategories
        }
    }
    
    var body: some View {
        
        VStack {
            
            search
            Divider()
           
           
            menu
            Divider()

            if isLoading {
                ProgressView()
            } else if searchSuggestions.isEmpty {
                categoriesList
            } else {
                searchSuggestionsList
            }

            Spacer()
        }.onAppear {
            selectedClothingCategory = userSettingsRepository.get().preferedClothingCategory
//            switch userSettingsRepository.get().preferedTab {
//            case 0:
//                selectedClothingCategory = .dame
//            case 1:
//                selectedClothingCategory = .herre
//            case 2:
//                selectedClothingCategory = .baby
//            default:
//                break
//            }
        }
    }
    
    var search: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            TextField(text: $textfieldText) {
                Text("Søk")
            }.onSubmit {
                print("The search text is \(textfieldText)")
                isLoading = true
                Task {
                    // Do some "API" call to get the actual suggestions list
                    searchSuggestions = await fetchSuggestions(for: textfieldText)
                    isLoading = false
                    // While we do that -> Loader
                    // Afterwards display the fetched list
    //                searchSuggestions = [textfieldText, textfieldText + "_suffix"]
                }
            }
        }
        .padding(.leading)
        .padding(.bottom)
    }

    func fetchSuggestions(for searchText: String) async -> [String] {
        try? await Task.sleep(for: .seconds(1))
        return [textfieldText, textfieldText + "_suffix"]
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
    
    var categoriesList: some View {
        List {
            ForEach(searchCategories) { searchCategory in
                Label(
                    searchCategory.name,
                    systemImage: searchCategory.systemImageName
                )
            }
        }
        .listStyle(.plain)
    }

    var searchSuggestionsList: some View {
        List {
            ForEach(searchSuggestions, id: \.self) { searchSuggestion in
                NavigationLink {
                    SearchResults()
                } label: {
                    Text(searchSuggestion)
                }
            }
        }
        .listStyle(.plain)
    }

}

#Preview {
    SearchView()
}
