//
//  Models.swift
//  StudentRegistry
//
//  Created by Håkon Bogen on 15/10/2025.
//
import SwiftData
import Foundation

@Model
class Student {
    var id: UUID
    var name: String
    var email: String
    
    @Relationship(deleteRule: .cascade, inverse: \Enrollment.student)
    var enrollments: [Enrollment]
    
    init(name: String, email: String, enrollments: [Enrollment]) {
        self.id = UUID()
        self.name = name
        self.email = email
        self.enrollments = enrollments
    }
}

@Model
class Enrollment {
    var id: UUID
    var enrollmentDate: Date
    var grade: String?
    
    var student: Student?
    var course: Course?
    
    init(grade: String? = nil, student: Student? = nil, course: Course? = nil) {
        self.id = UUID()
        self.enrollmentDate = Date()
        self.grade = grade
        self.student = student
        self.course = course
    }
    
}

@Model
class Course {
    
    var id: UUID
    var title: String
    var code: String
    var credits: Double
    
    @Relationship(deleteRule: .cascade, inverse: \Enrollment.course)
    var enrollments: [Enrollment]
    
    
    init(title: String, code: String, credits: Double, enrollments: [Enrollment]) {
        self.id = UUID()
        self.title = title
        self.code = code
        self.credits = credits
        self.enrollments = enrollments
    }
    
}

