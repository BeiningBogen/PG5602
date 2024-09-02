//
//  Contact.swift
//  Forelesning3
//
//  Created by Edouard Siegel on 02/09/2024.
//

import Foundation

struct Contact {
    let image: SomeSfSymbols
    let name: String
    let phoneNumber: String
    let isFavorite: Bool = false

    static let mocks = [
        Contact(
            image: SomeSfSymbols.menucard,
            name: "John Menu",
            phoneNumber: "901 34 483"
        ),
        Contact(
            image: SomeSfSymbols.arrowupandpersonrectangleturnright,
            name: "Donna ArrowUp",
            phoneNumber: "934 12 117"
        ),
        Contact(
            image: SomeSfSymbols.figureracquetball,
            name: "Mike Racquet",
            phoneNumber: "329 12 239"
        ),
        Contact(
            image: SomeSfSymbols.linkbadgeplus,
            name: "Tonny Badge",
            phoneNumber: "913 14 753"
        ),
        Contact(
            image: SomeSfSymbols.trayfill,
            name: "Bob Tray",
            phoneNumber: "989 84 213"
        )
    ]

}
