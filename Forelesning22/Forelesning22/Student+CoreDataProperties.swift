//
//  Student+CoreDataProperties.swift
//  Forelesning22
//
//  Created by Håkon Bogen on 07/11/2023.
//
//

import Foundation
import CoreData


extension Student {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Student> {
        return NSFetchRequest<Student>(entityName: "Student")
    }

    @NSManaged public var name: String?
    @NSManaged public var school: School?

}

extension Student : Identifiable {

}
