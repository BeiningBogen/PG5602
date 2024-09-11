//
//  SearchResults.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 11/09/2024.
//

import SwiftUI

struct SearchResults: View {
    
    var body: some View {
        ScrollView {
            subcategories
            filters
            productsGrid
        }
        .padding()
    }

    // MARK: - Private

    var subcategories: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                SearchResultsSubcategoryCell(subcategory: "Polo")
                SearchResultsSubcategoryCell(subcategory: "Skjorter")
                SearchResultsSubcategoryCell(subcategory: "Others")
            }
        }
        .padding(.bottom)
    }

    @ViewBuilder
    var filters: some View {
        Text("Populaere filter")
            .frame(maxWidth: .infinity, alignment: .leading)
        ScrollView(.horizontal) {
            LazyHStack {
                Text("New")
                Text("Brands")
                Text("Price")
            }
        }
    }

    private var product = Product(brand: "Brand", name: "Name", price: 20, delivery: "Delivery")

    var productsGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible())
        ],
                  spacing: 20,
                  content: {
            SearchResultsProductCell(product: product)
            SearchResultsProductCell(product: product)
            SearchResultsProductCell(product: product)

            Section {
                SearchResultsProductCell(product: product)
                SearchResultsProductCell(product: product)
                SearchResultsProductCell(product: product)
            } header: {
                Text("Some header")
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .background(.red)
            }

        })
    }
}

#Preview {
    SearchResults()
}
