//
//  CoursesView.swift
//  StudentRegistry
//
//  Created by Håkon Bogen on 15/10/2025.
//

import SwiftUI
import SwiftData

//func destination() -> some View {
//    
//}

struct CoursesView: View {
    // Hent data
    @Query(sort: \Course.code) private var courses: [Course]
    // Tilgang til databasen
    @Environment(\.modelContext) private var modelContext
    
    // Viser vi add course-skjermen?
    @State private var isShowingAddCourse = false
    
    var body: some View {
        // Vis data
        NavigationStack {
            List {
                // Gå gjennom hvert element i arrayet
                ForEach(courses) { course in // parameter course i closuren
                    NavigationLink {
                        // Hvor navigerer vi til, når vi trykker på dette elementet?
                        Text("Course Detail view")
                    } label: {
                        // Hvordan ser denne knappen ut?
                        Text(course.title)
                            .font(.headline)
                    } // End NavigationLink
                    
                } // End ForEach
            } // End List
            .navigationTitle("Courses")
            .toolbar  {
                // Knapper i toppen
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        // Hva skjer når man trykker på knappen?
                        // vis add course-skjerm
                        isShowingAddCourse = true
                    } label: {
                        // Hvordan ser knappen ut?
                        Image(systemName: "plus")
                    }

                }
            }
            // Lytter på isShowingAdd Course
            .sheet(isPresented: $isShowingAddCourse) {
                // Hvilket view/skjerm skal vises når denne closure kjører?
                // Aka når isShowingAddCourse == true
                AddCourseView()
                // @TODO: Lag AddCourseView
            }
        }
    }
}

#Preview {
    CoursesView()
}
