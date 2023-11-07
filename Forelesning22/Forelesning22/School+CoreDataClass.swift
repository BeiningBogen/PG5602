//
//  School+CoreDataClass.swift
//  Forelesning22
//
//  Created by Håkon Bogen on 07/11/2023.
//
//

import Foundation
import CoreData

@objc(School)
public class School: NSManagedObject, Decodable {
    enum CodingKeys: CodingKey {
        case name
        case students
    }
    
    public required init(from decoder: Decoder) throws {
        
        super.init(entity:
                .entity(forEntityName: "School", in: PersistenceController.shared.container.viewContext)!,
                   insertInto: PersistenceController.shared.container.viewContext)
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        
        if let students = try container.decodeIfPresent([Student].self, forKey: .students)
        {
            self.students = NSSet(array: students)
            for student in students {
                student.school = self
            }
            
        } else {
            self.students = NSSet()
        }
        
    }
}
