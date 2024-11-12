//
//  Item.swift
//  Testproject141
//
//  Created by Håkon Bogen on 12/11/2024.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
