

import SwiftUI
import SwiftData

struct AddStudentView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var modelContext
    
    @State private var name = ""
    @State private var email = ""
    
    func onSaveButtonTapped() {
        let student = Student(name: name, email: email, enrollments: [])
        modelContext.insert(student)
        dismiss()
//        modelContext.save()
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Student details") {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .textInputAutocapitalization(.never)
                    
                }
            }
            .navigationTitle("Add Student")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                     // Hva skjer når vi kaller cancel?
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        onSaveButtonTapped()
                    }
                }
            }
        }
    }
}
#Preview {
    AddStudentView()
}

