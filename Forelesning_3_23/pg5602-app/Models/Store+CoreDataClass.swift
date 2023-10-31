//
//  Store+CoreDataClass.swift
//  pg6502-app
//
//  Created by Håkon Bogen on 31/10/2023.
//
//

import Foundation
import CoreData

//class Student {
//    let name: String
//    init(name: String) {
//        self.name = name
//    }
//}

//Student()

@objc(Store)
public class Store: NSManagedObject, Decodable {
    
    enum CodingKeys: CodingKey {
        
        case longitude
        case latitude
        case openingHours
        case name
        
    }
    
    public override init(entity: NSEntityDescription, insertInto context: NSManagedObjectContext?) {
        super.init(entity: entity, insertInto: context)
    }
    
    public required init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decodeIfPresent(String.self, forKey: .name)
        let longitude = try container.decode(Float.self, forKey: .longitude)
        let latitude = try container.decode(Float.self, forKey: .latitude)
        let openingHours = try container.decodeIfPresent(String.self, forKey: .openingHours)
        
        let dataController = DataController.shared
        let managedObjectContext = dataController.container.viewContext
        
        super.init(entity:
                .entity(forEntityName: "Store", in: managedObjectContext)!, insertInto: managedObjectContext)
        
        self.name = name
        self.longitude = longitude
        self.latitude = latitude
        self.openingHours = openingHours
        
        
        
    }
}
