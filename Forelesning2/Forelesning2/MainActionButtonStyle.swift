//
//  MainActionButtonStyle.swift
//  Forelesning2
//
//  Created by Edouard Siegel on 28/08/2024.
//

import SwiftUI

struct MainActionButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(
                configuration.isPressed
                ? Color(red: 0, green: 0.5, blue: 0.5)
                : Color(red: 0, green: 0, blue: 0.5)
            )
            .foregroundStyle(.white)
            .clipShape(Capsule())
    }
}
