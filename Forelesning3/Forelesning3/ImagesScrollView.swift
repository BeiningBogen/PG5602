//
//  ImagesScrollView.swift
//  Forelesning3
//
//  Created by Edouard Siegel on 03/09/2024.
//

import SwiftUI

struct ImagesScrollView: View {

    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(SomeSfSymbols.allCases) { sfSymbol in
                    Image(systemName: sfSymbol.rawValue)
                }
            }
            .frame(maxHeight: .infinity)
        }
        .background(.red)
    }

}
