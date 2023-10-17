//
//  CoolTextFieldStyle.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 16/10/2023.
//

import SwiftUI

struct CoolTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
//        ZStack {
//            Color.red
            content
                .textFieldStyle(.roundedBorder)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color.black, lineWidth: 2)
                )
//        }
    }
}

private struct CoolTextFieldStylePreview: View {
    @State var nameText = ""
    @State var phoneText = ""
    
    var body: some View {
        VStack {
            TextField("Navn", text: $nameText)
                .modifier(CoolTextFieldStyle())
                .padding()
            
            HStack {
                TextField("Telefonnummer", text: $phoneText)
                    .modifier(CoolTextFieldStyle())
                    .padding()
                
                TextField("Telefonnummer", text: $phoneText)
                    .modifier(CoolTextFieldStyle())
                    .padding()
                    .coolTextfieldStyle
                    
            }
        }
    }
}

extension View {
    
    var coolTextfieldStyle: some View {
//        return self
//        self
            modifier(CoolTextFieldStyle())
        
//        modifier(CoolTextFieldStyle())
    }
}

struct CoolTextFieldStyle_Previews: PreviewProvider {
    static var previews: some View {
        CoolTextFieldStylePreview()
    }
}
