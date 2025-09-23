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
    
    let regions = ["europe", "asia", "africa", "oceania", "america"]
    
    var body: some View {
        VStack {
            Text("Verdens land")
                .font(.largeTitle)
            
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
            
            if isLoading {
                ProgressView("Henter land")
            } else if let errorMessage = errorMessage {
                Text(errorMessage)
            } else {
                
                List(countries) { country in
                    CountryRowView(country: country)
                }
                
            }
            
        }
        .padding()
    }
    
    func getCountries() async {
        isLoading = true
        errorMessage = nil
        do {
            let url = URL(string: "https://restcountries.com/v3.1/region/\(selectedRegion)")!
            let (data, response) = try await URLSession.shared.data(from: url)
            let fetchedCountries = try JSONDecoder().decode([Country].self, from: data)
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
