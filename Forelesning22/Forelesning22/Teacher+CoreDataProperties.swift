//
//  Teacher+CoreDataProperties.swift
//  Forelesning22
//
//  Created by Håkon Bogen on 07/11/2023.
//
//

import Foundation
import CoreData


extension Teacher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Teacher> {
        return NSFetchRequest<Teacher>(entityName: "Teacher")
    }

    @NSManaged public var name: String?
    @NSManaged public var school: School?

}

extension Teacher : Identifiable {

}
