//
//  MySearchBar.swift
//  Forelesning_9
//
//  Created by Håkon Bogen on 24/09/2025.
//

import SwiftUI

struct MySearchBar: View  {
    @Binding var text: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass.circle")
                .foregroundStyle(.cyan)
            TextField("Search", text: $text)
                .textFieldStyle(.roundedBorder)
        }.padding()
    }
}


#Preview {
    MySearchBar(text: .constant("Hello world!"))
}
