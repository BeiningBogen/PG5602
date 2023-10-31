//
//  StoreView.swift
//  pg6502-app
//
//  Created by Håkon Bogen on 23/10/2023.
//

import SwiftUI
import CoreData
import MapKit

struct StoreView: View {
    
    enum SheetState {
        case addStore
        case openingHours(store: Store)
        case none
    }
    
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: [.init(key: "name", ascending: true)]) var stores: FetchedResults<Store>
    
    @State var isShowingSheet = false
    @State var sheetState = SheetState.none
    
    var body: some View {
        
        VStack {

//            Map(coordinateRegion: .constant(.init(center: .init(latitude: 10, longitude: 10), span: .init(latitudeDelta: 1, longitudeDelta: 1))))
                
            Map(mapRect:
                    .constant(.world),
                annotationItems: stores) { store in
                
                MapAnnotation(coordinate: CLLocationCoordinate2D(latitude: CLLocationDegrees(store.latitude), longitude: CLLocationDegrees(store.longitude))) {
                    
                    HStack {
                        Circle()
                            .fill(.black)
                        Text(store.name ?? "Ukjent navn")
                    }.onTapGesture {
                        print("did tap \(store.name)")
                        sheetState = .openingHours(store: store)
                        isShowingSheet = true
                    }
                }
//                MapMarker(coordinate:
//                            CLLocationCoordinate2D.init(latitude: CLLocationDegrees(store.latitude), longitude: CLLocationDegrees(store.longitude)))
            }
            
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
                sheetState = .addStore
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    print(sheetState)
                    isShowingSheet = true
                }
            }
            .buttonStyle(.bordered)
        }.onAppear {
            if moc.hasChanges {
                moc.undo()
            } else {
                
            }
        }.sheet(isPresented: $isShowingSheet) {
            switch sheetState {
                case .addStore:
                    AddStoreView(isPresented: $isShowingSheet)
                case .openingHours(store: let store):
                    Text("\(store.openingHours ?? "Ukjent")")
                        .presentationDetents([.height(150)])
                    
                case .none:
                    EmptyView()
            }
        }.task {
            //
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
