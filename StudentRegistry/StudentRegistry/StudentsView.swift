//
//  ContentView.swift
//  StudentRegistry
//
//  Created by Håkon Bogen on 15/10/2025.
//

import SwiftUI
import SwiftData

struct StudentsView: View {
    
    // spørring mot databasen som er Select * from STUDENTS
    @Query(sort: \Student.name) private var students: [Student]
    // referansen til databasen vår
    // 3 steg
    // 1. -> Lag objekt Student()
    // 2. insert i context: modelContext.insert(student)
    // 3. lagre context til disk: modelContext.save()
    @Environment(\.modelContext) private var modelContext
    
    @State private var isShowingAddStudentsView = false
    
    private func onDeleteStudents(at offsets: IndexSet) {
        
    }
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(students) { student in
                    NavigationLink {
                        // Hvor kommer man når man trykker på student?
                         StudentDetailView(student: student)
                    } label: {
                        VStack(alignment: .leading) {
                            Text(student.name)
                                .font(.headline)
                            
                            Text(student.email)
                                .font(.subheadline)
                                .foregroundStyle(.secondary)
                            
                            Text("\(student.enrollments.count) kurs")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                }.onDelete(perform: onDeleteStudents(at:))
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingAddStudentsView = true
                    } label: {
                        Image(systemName: "plus")
                    }

                }
            }.sheet(isPresented: $isShowingAddStudentsView) {
                AddStudentView()
            }
        }
        .padding()
    }
}

#Preview {
            do {
                let config = ModelConfiguration(isStoredInMemoryOnly: true)
                let container = try ModelContainer(for:
                                                    Student.self, Course.self, Enrollment.self , configurations: config)
                let student1 = Student(name: "Håkon", email: "hakon@kristiania.no", enrollments: [])
                container.mainContext.insert(student1)
                
                let iOS = Course(title: "iOS Development", code: "PG5602", credits: 15, enrollments: [])
                container.mainContext.insert(iOS)
                
                let enrollment1 = Enrollment(student: student1, course: iOS)
                container.mainContext.insert(enrollment1)
                
                return StudentsView()
                    .modelContainer(container)
                
            } catch {
                fatalError()
        
            }
   
//    StudentsView()
}
