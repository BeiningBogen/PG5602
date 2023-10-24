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
    
    @FetchRequest(sortDescriptors: [.init(key: "name", ascending: true)]) var stores: FetchedResults<Store>
    
    @State var isShowingAddStoreView = false
    
    var body: some View {
        VStack {
            
            Text("Hello, World!")
            ForEach(stores) { store in
                
                HStack {
                    Text(store.name ?? "N/A")
                    Text("\(store.longitude)")
                }
            }
            
            Button("Insert store") {
                //            Store()
                let entity = NSEntityDescription.entity(forEntityName: "Store", in: moc)!
                let store = Store(entity: entity, insertInto: moc)
                store.name = "testbutikk 1"
                store.latitude = 52.3344234
                store.longitude = 10.3242111
                store.openingHours = "man-fre 07:00-17:00"
                
                
                moc.saveAndPrintError()
            }
            
            Button("Delete all") {
                for store in stores {
                    moc.delete(store)
                }
                
                moc.saveAndPrintError()
            }
            Button("Add new store") {
                isShowingAddStoreView = true
            }
            .buttonStyle(.bordered)
        }.onAppear {
            if moc.hasChanges {
                moc.undo()
            } else {
                
            }
        }.sheet(isPresented: $isShowingAddStoreView) {
            AddStoreView()
                .onDisappear {
                    print(isShowingAddStoreView)
                }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}


extension NSManagedObjectContext {
    func saveAndPrintError() {
        do {
            try self.save()
        } catch let error {
            print(error)
        }
    }
}
