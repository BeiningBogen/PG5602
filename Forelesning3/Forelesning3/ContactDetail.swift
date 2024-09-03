//
//  ContactDetail.swift
//  Forelesning3
//
//  Created by Edouard Siegel on 03/09/2024.
//

import SwiftUI

struct ContactDetail: View {

    var contact: Contact

    var body: some View {
        VStack {
            Image(systemName: contact.image.rawValue)
            Text(contact.name)
            Text(contact.phoneNumber)
            Image(systemName: contact.isFavorite ? "star.fill" : "star")
        }
    }

}
