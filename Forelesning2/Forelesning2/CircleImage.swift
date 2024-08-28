//
//  CircleImage.swift
//  Forelesning2
//
//  Created by Edouard Siegel on 28/08/2024.
//

import SwiftUI

struct CircleImage: View {

    private var resource: ImageResource

    init(_ resource: ImageResource) {
        self.resource = resource
    }

    var body: some View {
        Image(resource)
            .resizable()
            .frame(width: 250, height: 250, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.green, lineWidth: 3)
            }
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 10, x: 50, y: 30)
    }
}
