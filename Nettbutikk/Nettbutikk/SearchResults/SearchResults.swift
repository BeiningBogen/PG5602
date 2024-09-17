//
//  SearchResults.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 11/09/2024.
//

import SwiftUI

struct SearchResults: View {

    @State var products = [Product]()
    private let searchRepository = SearchRepository()

    var body: some View {
        ScrollView {
            subcategories
            filters
            productsGrid
        }.onAppear {
            print("view appeared")
            // request products according to search parameters
            Task {
                products = await searchRepository.fetchSearchResults()
                // fetch some products
                // update view
            }
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

    var productsGrid: some View {
        LazyVGrid(columns: [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible())
        ],
                  spacing: 20,
                  content: {
            ForEach(products, id: \.self) { product in
                SearchResultsProductCell(product: product)
            }

            Section {
                ForEach(products, id: \.self) { product in
                    SearchResultsProductCell(product: product)
                }
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
