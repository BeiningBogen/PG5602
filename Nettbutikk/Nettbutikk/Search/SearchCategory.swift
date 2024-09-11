//
//  SearchCategory.swift
//  Nettbutikk
//
//  Created by Edouard Siegel on 11/09/2024.
//

import Foundation

struct SearchCategory: Identifiable, Equatable, Hashable {

    public var id: Self { return self }

    let name: String
    let systemImageName: String

    static var defaultCategories = [
        SearchCategory(name: "Nordisk stil", systemImageName: "heart"),
        SearchCategory(name: "Nyheter", systemImageName: "star"),
        SearchCategory(name: "Klær", systemImageName: "figure.mixed.cardio"),
    ]

    static var barnCategories = [
        SearchCategory(name: "Back to school", systemImageName: "graduationcap"),
        SearchCategory(name: "Nyheter", systemImageName: "star"),
        SearchCategory(name: "Klær", systemImageName: "figure.mixed.cardio"),
    ]
}
