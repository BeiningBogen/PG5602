//
//  AddProductView.swift
//  Forelesning_3_23
//
//  Created by Håkon Bogen on 11/09/2023.
//

import SwiftUI

struct AddProductView: View {
    
    /// Textfield attributes
    @State var newProductName: String = ""
    @State var newProductPrice: String = ""
    @State var newProductDescription: String = ""
    
    var didAddProduct: ((Product) -> ())
    
//    var myname: String
    
    func addProduct() {
        
    }
    
    var body: some View {
        VStack(alignment: .trailing) {
            HStack {
                Text("Legg til nytt produkt")
                    .font(.title)
                    .padding(30)
                Spacer()
            } // title hstack
            
            TextField("Produktnavn", text: $newProductName)
            
            TextField("Beskrivelse", text: $newProductDescription)
            TextField("Pris", text: $newProductPrice)
            
            Button {
                // user tapped button
                print("user tapped button")
                addProduct()
                
            } label: {
                VStack {
                    Text("Lagre")
                    Text("Produkt")
                }
            }
            Spacer()
        }
    }
}

struct AddProductView_Previews: PreviewProvider {
    static var previews: some View {
        AddProductView() { product in
            
        }
    }
}
