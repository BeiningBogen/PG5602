//
//  Data+Prettyprint.swift
//  Nettbutikk
//
//  Created by Håkon Bogen on 25/09/2024.
//

import Foundation


extension Data {
     func prettyPrint() {
         
         let stringValue = String(data: self, encoding: .utf8)
//         if stringValue == nil {
//             print(stringValue!)
//         } else {
//             print("No data")
//         }
         
         print(stringValue ?? "No data")
    }
}
