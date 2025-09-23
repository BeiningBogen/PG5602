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
                    .frame(width: 40)
            } placeholder: {
                Text(country.flag)
            }
            Text(country.name.common)
        }
    }
}

#Preview {
    let countryName = Country.CountryName.init(common: "Norge", official: "Kongeriket Norge")
    
    let flag = Country.Flag.init(png: "", svg: "", alt: "Firkant med blå og hvite striper med rød rundt")
    let coatOfArms = Country.CoatOfArms(png: nil, svg: nil)
    
    let country = Country(name: countryName, region: "europe", subregion: "Skandinavia", population: 5400000, flag: "🇳🇴", flags: flag, coatOfArms: coatOfArms)
    
    List {
        CountryRowView(country: country)
    }
}
