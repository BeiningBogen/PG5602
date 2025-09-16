//
//  ContentView.swift
//  Forelesning7
//
//  Created by Håkon Bogen on 16/09/2025.
//

import SwiftUI

struct ContentView: View {
    
    let photoURLs = [
        "https://picsum.photos/300/200?random=1",
        "https://picsum.photos/200/400?random=1",
        "https://picsum.p/200/400?random=1"
    ]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [
                    // Hvordan er layouten?
                    GridItem(.flexible()),
                    GridItem(.flexible())
                ]) {
                    ForEach(0..<photoURLs.count, id: \.self) { index in
                        let urlString = photoURLs[index]
                        AsyncImage(url: URL(string: urlString))
                        { image in
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 150, height: 150)
                                .clipped()
                                .cornerRadius(10)
                            
                        } placeholder: {
                            
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.gray.opacity(0.3))
                                .frame(width: 150, height: 150)
                                .overlay {
                                    ProgressView()
                                        .progressViewStyle(.circular)
                                }
                        }
                    }
                    // Selve bildene som skal være der
                }
            } // End ScrollView
        } // End NavigationView
    } // End body
}


#Preview {
    ContentView()
}
