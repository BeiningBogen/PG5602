//
//  ContactCell.swift
//  Forelesning3
//
//  Created by Edouard Siegel on 03/09/2024.
//

import SwiftUI

struct ContactCell: View {

    var contact: Contact

    var body: some View {
        HStack {
            VStack {
                Text(contact.name)
                Text(contact.phoneNumber)
            }
            Spacer()
            Image(systemName: contact.isFavorite ? "star.fill" : "star" )
        }
    }

}

#Preview {
    ContactCell(contact: Contact.mocks[0])
}

