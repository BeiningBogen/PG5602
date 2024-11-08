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

struct NettbutikkError: Error, LocalizedError {
    var errorDescription: String? {
        return "Noe gikk galt :("
    }
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
    
    @State var error: NettbutikkError?
    @State var isShowingError = false

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
        .alert(isPresented: $isShowingError, error: error) {
            Button("OK") {
                isShowingError = false
            }
        }
//        .alert("Noe gikk galt :(", isPresented: $isShowingError) {
//            Button("OK") {
//                isShowingError = false
//            }
//        }
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
                    do  {
                        searchSuggestions = try await fetchSuggestions(for: textfieldText)
                        isLoading = false
                    } catch {
//                        self.error = NettbutikkError
                        isShowingError = true
                        isLoading = false
                    }
                    // While we do that -> Loader
                    // Afterwards display the fetched list
    //                searchSuggestions = [textfieldText, textfieldText + "_suffix"]
                }
            }
        }
        .padding(.leading)
        .padding(.bottom)
    }

    func fetchSuggestions(for searchText: String) async throws -> [String] {
      //  let urlRequest = URLRequest(url: URL(string: "https://raw.githubusercontent.com/BeiningBogen/PG5602/refs/heads/master/Nettbutikk/searchresults.json")!)
        let request = URLRequest.standard(url: URL(string: "ttps://raw.githubusercontent.com/BeiningBogen/PG5602/refs/heads/master/Nettbutikk/searchresults.json")!)
            
            let (data, response) = try await URLSession.shared.data(for: request)
            let searchResults = try JSONDecoder().decode([String].self, from: data)
            print(searchResults)
            return searchResults
     
        
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
