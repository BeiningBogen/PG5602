//
//  DataController.swift
//  pg6502-app
//
//  Created by Håkon Bogen on 23/10/2023.
//

import Foundation
import CoreData


class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Model")
        
    init() {
        
        container.loadPersistentStores { description, error in
//            Store
            if let error = error {
                print(error)
            }
            print(description)
            
        }
            
    }
    
    static let shared = DataController()
}


func testStuff() {
    DataController.shared
//    UIApplication.shared
}
