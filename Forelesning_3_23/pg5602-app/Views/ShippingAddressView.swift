//
//  ShippingAddressView.swift
//  pg6502-app
//
//  Created by Håkon Bogen on 13/11/2023.
//

import SwiftUI

class ShippingAddressViewModel: ObservableObject {
    
    let apiClient = APIClient.demo
    
    @Published var welcomeText = "Hello world!"
    @Published var address = ""
    @Published var postalCode = ""
    
    @Published var isShowingError = false
    
    fileprivate var anotherText = ""
    func onAppear() {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.welcomeText = "hello norway"
        }
        
    }
    
    func didTapSubmitButton() {
        print(address)
        Task {
            do {
                
                try await apiClient.updateAddress(address, postalCode)
                // gå tilbake til forrige skjerm?
            } catch let error {
                print(error)
                isShowingError = true
            }
        }
            
    }
}

struct ShippingAddressView: View {
    @StateObject var viewModel = ShippingAddressViewModel()
    
    var body: some View {
        VStack {
            Form {
                TextField("Adresse", text: $viewModel.address)
                TextField("Postnummer", text: $viewModel.postalCode)
                
                Text(viewModel.welcomeText)
                
                Button {
                    viewModel.didTapSubmitButton()
                } label: {
                    Text("Submit")
                }
            }
        }.onAppear {
            viewModel.onAppear()
        }.alert("Noe feil skjedde", isPresented: $viewModel.isShowingError) {
            
        } message: {
            
        }

    }
}

struct ShippingAddressView_Previews: PreviewProvider {
    static var previews: some View {
        ShippingAddressView()
    }
}
