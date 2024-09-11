//
//  SearchResultsCategoryCell.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 11/09/2024.
//

import SwiftUI

struct SearchResultsSubcategoryCell: View {

    var subcategory: String

    var body: some View {
        Text(subcategory)
            .padding()
            .background(.gray)
    }
}
