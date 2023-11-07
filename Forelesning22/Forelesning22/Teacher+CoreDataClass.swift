//
//  Teacher+CoreDataClass.swift
//  Forelesning22
//
//  Created by Håkon Bogen on 07/11/2023.
//
//

import Foundation
import CoreData

@objc(Teacher)
public class Teacher: NSManagedObject, Decodable {
    
    enum CodingKeys: CodingKey {
        case name
        case school
    }
    
    public required init(from decoder: Decoder) throws {
        let moc = PersistenceController.shared.container.viewContext
        let schools = try moc.fetch(School.fetchRequest())
        let teachers = try moc.fetch(Teacher.fetchRequest())
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let name = try container.decode(String.self, forKey: .name)
        
        if teachers.contains(where:  { $0.name == name } ) {
            throw DatabaseError.duplicationError
        } else {
            super.init(entity: .entity(forEntityName: "Teacher", in: moc)!, insertInto: moc)
            self.name = name
            let id = try container.decode(Int.self, forKey: .school)
            let school = schools.first(where: {$0.id == id })
            school?.addToTeachers(self)
        }
        
    }

}

enum DatabaseError : Error {
    case duplicationError
}
