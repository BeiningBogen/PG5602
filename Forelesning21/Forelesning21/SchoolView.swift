//
//  SchoolView.swift
//  Forelesning21
//
//  Created by Håkon Bogen on 06/11/2023.
//

import SwiftUI

struct SchoolView: View {
    
    @State var school: School
    @State var students: [Student]
    
    init(school: School) {
        self.school = school
        if let students = school.students?.allObjects as? [Student] {
//            self.students = students.map { $0 as! Student }
//            self.students = students.allObjects as! [Student]
            self.students = students
        } else {
            self.students = []
        }
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Velkommen til \(school.name ?? "Ukjent skole")")
                    .padding()
                    .font(.title)
                Spacer()
            }
            Text("Stedet der læring skjer")
                .padding(.horizontal)
            
            Spacer()
        
            List {
                Section("Bachelor") {
                    ForEach(students) { student in
                        if let name = student.name {
                            Text(name)
                        } else {
                            Text("anonym")
                        }
                        //                    Text(student.name ?? "anonym")
                    }
                }
                
                Section("Master") {
                    
                }
            }
        }
    }
}

struct SchoolView_Previews: PreviewProvider {
    static var previews: some View {
        SchoolView(school: .init(context: PersistenceController.preview.container.viewContext))
    }
}
