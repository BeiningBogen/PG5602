//
//  SearchResultsProductCell.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 11/09/2024.
//

import SwiftUI

struct SearchResultsProductCell: View {

    var product: Product

    var body: some View {
        VStack(alignment: .leading) {
            imageHeader
            Text(product.brand)
                .font(.body)
            Text(product.name)
//            NumberFormatter() + NSNumberFormatterCurrencyStyle
            Text("\(product.price)")
//            Text(product.delivery)
//                .font(.footnote)
        }
        .background(.green)
    }

    // MARK: - Private

    private var imageHeader: some View {
        ZStack {
            Image(systemName: "star")
                .resizable()
                .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            VStack {
                Button("favorite") {
                    print("toggle favorite")
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer()
                Text("Nyhet")
                    .background(.red)
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
            }
        }
    }

}

#Preview {
    SearchResultsProductCell(product: .mock)
}
