//
//  AddStoreView.swift
//  pg6502-app
//
//  Created by Håkon Bogen on 24/10/2023.
//

import SwiftUI
import CoreData


struct AddStoreView: View {
    
    enum FormError: String, Error {
        case missingName
        case missingLongitude
        case missingLatitude
        case missingOpeningHours
        
        var localizedName: String {
            switch self {
                case .missingName:
                    return "Butikknavn"
                case .missingLatitude:
                    return "Breddegrad"
                case .missingLongitude:
                    return "Lengdegrad"
                case .missingOpeningHours:
                    return "Åpningstider"
            }
        }
    }
    
    @State var storeName = ""
    @State var longitude = ""
    @State var latitude = ""
    @State var openingHours = ""
    
    @State var isShowingError = false
    
    @State var validationErrors = [FormError]()
    
    func didTapSaveButton() {
        var errors = [FormError]()
        
        if storeName.isEmpty {
            // missingName
            errors.append(.missingName)
        }
        
//        if email.isValidEmail == false {
//            errors.append(.wrongEmailFormat)
//        }
        if longitude.isEmpty {
            errors.append(.missingLongitude)
        }
        
        if latitude.isEmpty {
            errors.append(.missingLatitude)
        }
        if openingHours.isEmpty {
            errors.append(.missingOpeningHours)
        }
        
        if errors.isEmpty {
            // save store
        } else {
            // show error
            isShowingError = true
            validationErrors = errors
        }
    }
    
    var body: some View {
        Form {
            Section("Opprett butikk") {
                TextField("Name", text: $storeName)
                TextField("Longitude", text: $longitude)
                TextField("Latitude", text: $latitude)
                TextField("Opening hours", text: $openingHours)
            }
            Section {
                Button("Lagre") {
                    didTapSaveButton()
                }
            }
        }.alert(isPresented: $isShowingError) {
            Alert(title:
                    Text("Manglende felter: "),
                  message: Text("\(validationErrors.text)"))
        }
    }
}

struct AddStoreView_Previews: PreviewProvider {
    static var previews: some View {
        AddStoreView()
    }
}

private extension Array where Element == AddStoreView.FormError
{
    var text: String {
        var text = ""
        forEach { error in
            text += error.localizedName
            text += "\n"
        }
//        for error in self {
//            text += error.localizedName
//            text += "\n"
//        }
        return text
    }
}

