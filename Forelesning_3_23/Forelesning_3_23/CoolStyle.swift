//
//  CoolStyle.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 16/10/2023.
//

import Foundation
import SwiftUI

struct CoolStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .aspectRatio(contentMode: .fill)
            .frame(width: 250, height: 250)
            .clipped()
            .cornerRadius(25)
            .shadow(color: .black, radius: 20)
        
    }
}


struct CoolStyle_Previews: PreviewProvider {
    static var previews: some View {
        Image("productImage")
            .resizable()
            .modifier(CoolStyle())
    }
}
