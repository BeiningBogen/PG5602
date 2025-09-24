//
//  ContentView.swift
//  Forelesning_9
//
//  Created by Håkon Bogen on 23/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isLoading = false
    @State private var countries = [Country]()
    @State private var errorMessage: String?
    @State private var selectedRegion = "europe"
    @State private var searchText = ""
    
    var filteredCountries: [Country] {
        if searchText.isEmpty {
            return countries
        }
        return countries
            .filter { country in
                
                return country.name.common.localizedCaseInsensitiveContains(searchText)
                
            }
        
    }
    
    let regions = ["europe", "asia", "africa", "oceania", "america"]
    
    var body: some View {
        VStack {
            Text("Verdens land")
                .wordArtStyle()
            MySearchBar(text: $searchText)
               // .wordArtStyle()
            
            Picker("Velg region", selection: $selectedRegion) {
                // Vis alle mulige regioner:
                ForEach(regions, id: \.self) { region in
                    Text(region)
                        
                }
            }.onChange(of: selectedRegion) {
                Task {
                    await getCountries()
                }
            }
            // View Modifier
            .pickerStyle(.segmented)
            
            if isLoading {
                ProgressView("Henter land")
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
            } else {
                
                List(filteredCountries) { country in
                    CountryRowView(country: country)
                }
                
            }
            
        }
        .padding()
        .wordArtStyle()
        .onAppear {
            Task {
                await getCountries()
            }
        }
    }
    
    func getCountries() async {
        isLoading = true
        errorMessage = nil
        do {
            let url = URL(string: "https://restcountries.com/v3.1/region/\(selectedRegion)")!
            let (data, response) = try await URLSession.shared.data(from: url)
            let fetchedCountries = try JSONDecoder().decode([Country].self, from: data)
       //     String(from:data, encoding: .utf8)
            print(String(data: data, encoding: .utf8))
            countries = fetchedCountries
            isLoading = false
            
            
        } catch let error {
            errorMessage = "Noe feil skjedde: \(error.localizedDescription)"
            isLoading = false
        }
    }
}

#Preview {
    ContentView()
}
