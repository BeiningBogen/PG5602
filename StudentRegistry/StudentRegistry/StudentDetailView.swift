//
//  StudentDetailView.swift
//  StudentRegistry
//
//  Created by Håkon Bogen on 22/10/2025.
//

import SwiftUI
import SwiftData


struct StudentDetailView: View  {
    
    let student: Student
    // Vis kursene til studenten
    @Query private var allCourses: [Course]
    @Environment(\.modelContext) private var modelContext
    
    @State private var isShowingEnrollCourse = false
    
    var enrolledCourses: [Course] {
        return student.enrollments
            .compactMap { $0.course }
        
        return student.enrollments
            .compactMap { enrollment in
                return enrollment.course
            }
    }
    
    var availableCourses: [Course] {
        // one liner
        let enrolledIds = Set(enrolledCourses.map { $0.id })
        
        // map = konverter et array til en annen type array
        // [Student] -> [String]
        
        let idsWithDuplicates = enrolledCourses.map  { course in
            return course.id
        }
        
        let enrolledIds2 = Set(idsWithDuplicates)
        
        
        return allCourses.filter { !enrolledIds.contains($0.id) }
        
        // filter -> filterer ut alle elementer basert på om closure returnerer true eller false
        return allCourses.filter { course in
            return !enrolledIds.contains(course.id)
        }
        
        // Finn alle ID fra enrolled courses
        // filtrer alle kurs me de IDene
        // [].filter { }
    }
    
    //    init(student: Student) {
    //        self.student = student
    //    }
    
    var body: some View {
        // Liste
        // Seksjon 1 personalia
        // Seksjon 2 påmeldte kurs
        ///          hvis grade i et kurs, vis grade, ellers vis "In progress"
        // Hvis tomt, skriv at studenten har ingen påmeldte kurs
        // Knapp + i navbar, som skal åpne "enroll to course view"
        // Dette viewet skal få "available courses", som studenten kan meldes på
        // hvis du blir ferdig fort, style views her med custom view modifiers. eks: regnbue font
        NavigationStack {
            List {
                Section("Student info") {
                    LabeledContent("Name", value: student.name)
                    LabeledContent("Email", value: student.email)
                }
                Section("Courses ") {
                    ForEach(student.enrollments) { enrollment in
                        if let course = enrollment.course {
                            HStack {
                                Text(course.title)
                                Spacer()
                                // if let på grade så vi kan vise at kurset er underveis
                                Text(enrollment.grade ?? "")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }.toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isShowingEnrollCourse = true
                            } label: {
                                Image(systemName: "plus")
                            }
                            
                        }
                    }
                    .sheet(isPresented: $isShowingEnrollCourse) {
                        EnrollStudentView(student: student, availableCourses: availableCourses)
                    }
                }
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for:
                                            Student.self, Course.self, Enrollment.self , configurations: config)
        let student1 = Student(name: "Alice Johnson", email: "alice@example.com", enrollments: [])
        container.mainContext.insert(student1)
        
        let iOS = Course(title: "iOS Development", code: "PG5602", credits: 15, enrollments: [])
        container.mainContext.insert(iOS)
        
        let enrollment1 = Enrollment(grade: "A", student: student1, course: iOS)
        container.mainContext.insert(enrollment1)
        
        return StudentDetailView(student: student1)
            .modelContainer(container)
        
    } catch {
        fatalError()
        
    }
}
