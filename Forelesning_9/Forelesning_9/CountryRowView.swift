//
//  CountryRowView.swift
//  Forelesning_9
//
//  Created by Håkon Bogen on 23/09/2025.
//

import SwiftUI

struct CountryRowView: View {
    
    let country: Country
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: country.flags.png)) { image in
                image
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .clipped()
                
            } placeholder: {
                Text(country.flag)
            }
            
            VStack {
                Text(country.name.common)
                // Optional chaining:
                if let capital = country.capital?.first {
                    Text(capital)
                        .foregroundStyle(.secondary)
                } // end if let
            } // end vstack
            
            Spacer()
            VStack {
                Text("Innbyggere: \(country.population)")
                Text("Areal: \(country.area) km")
            }
            
        }
    }
}

#Preview {
    let countryName = Country.CountryName.init(common: "Norge", official: "Kongeriket Norge")
    
    let flag = Country.Flag.init(png: "", svg: "", alt: "Firkant med blå og hvite striper med rød rundt")
    let coatOfArms = Country.CoatOfArms(png: nil, svg: nil)
    
    let country = Country(name: countryName, region: "europe", subregion: "Skandinavia", population: 5400000, flag: "🇳🇴", flags: flag, capital: ["Oslo"], area: 350000, coatOfArms: coatOfArms)
    
    List {
        CountryRowView(country: country)
    }
}
