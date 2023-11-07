//
//  School+CoreDataProperties.swift
//  Forelesning22
//
//  Created by Håkon Bogen on 07/11/2023.
//
//

import Foundation
import CoreData


extension School {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<School> {
        return NSFetchRequest<School>(entityName: "School")
    }

    @NSManaged public var name: String?
    @NSManaged public var id: Int32
    @NSManaged public var students: NSSet?
    @NSManaged public var teachers: NSSet?

}

// MARK: Generated accessors for students
extension School {

    @objc(addStudentsObject:)
    @NSManaged public func addToStudents(_ value: Student)

    @objc(removeStudentsObject:)
    @NSManaged public func removeFromStudents(_ value: Student)

    @objc(addStudents:)
    @NSManaged public func addToStudents(_ values: NSSet)

    @objc(removeStudents:)
    @NSManaged public func removeFromStudents(_ values: NSSet)

}

// MARK: Generated accessors for teachers
extension School {

    @objc(addTeachersObject:)
    @NSManaged public func addToTeachers(_ value: Teacher)

    @objc(removeTeachersObject:)
    @NSManaged public func removeFromTeachers(_ value: Teacher)

    @objc(addTeachers:)
    @NSManaged public func addToTeachers(_ values: NSSet)

    @objc(removeTeachers:)
    @NSManaged public func removeFromTeachers(_ values: NSSet)

}

extension School : Identifiable {

}
