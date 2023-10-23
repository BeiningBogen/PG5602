//
//  StoreView.swift
//  pg6502-app
//
//  Created by Håkon Bogen on 23/10/2023.
//

import SwiftUI
import CoreData

struct StoreView: View {
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Text("Hello, World!")
        
        Button("Insert store") {
//            Store()
            let entity = NSEntityDescription.entity(forEntityName: "Store", in: moc)!
            
            let store = Store(entity: entity, insertInto: moc)
            store.name = "testbutikk 1"
            store.latitude = 52.3344234
            store.longitude = 10.3242111
            
            do {
                try moc.save()
            } catch let error {
                print(error)
            }
            
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
