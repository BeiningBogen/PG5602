//
//  StudentRegistryApp.swift
//  StudentRegistry
//
//  Created by Håkon Bogen on 15/10/2025.
//

import SwiftUI
import SwiftData

@main
struct StudentRegistryApp: App {
    var body: some Scene {
        WindowGroup {
            MainTabView()
        }
    }
    
    
}

struct MainTabView: View {
    var body: some View {
        TabView {
            StudentsView()
                .tabItem {
                    Label("Students", systemImage: "person.2")
                }
            
            CoursesView()
                .tabItem {
                    Label("Courses", systemImage: "book")
                }
            
            EnrollmentsView()
                .tabItem  {
                    Label("Enrollments", systemImage: "list.bullet")
                }
            
        }.modelContainer(for: [Student.self, Course.self, Enrollment.self])
    }
}

#Preview {
    MainTabView()
}
