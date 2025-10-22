//
//  AddCourseView.swift
//  StudentRegistry
//
//  Created by Håkon Bogen on 21/10/2025.
//
import SwiftUI
import SwiftData

// Lag View



struct AddCourseView : View {
    // Mulighet for å lukke viewet vi er i selv
    @Environment(\.dismiss) private var dismiss
    
    // Tilggang til databasen
    @Environment(\.modelContext) private var modelContext
    
    @State private var title = ""
    @State private var code = ""
    @State private var credits = 7.5
    
    var isValid: Bool {
        // Hva skal denne returnere?
        return !title.isEmpty && !code.isEmpty
    }
    
    func saveCourse() {
        let newCourse = Course(title: title, code: code, credits: credits, enrollments: [Enrollment]())
        modelContext.insert(newCourse)
        // Ta høyde for exceptions
        do {
            // Faktisk skriv endringer i context til disk (persistere)
            try modelContext.save()
        } catch  {
            print(error)
        }
        
        dismiss()
        // Hvordan lagrer vi objektet i databasen?
        // Lukke skjermen?
    }

    var body: some View {
        NavigationStack {
            Form {
                TextField("Title", text: $title)
                TextField("Code", text: $code)
                    .textInputAutocapitalization(.characters)
                
                Picker("Credits", selection: $credits) {
                    ForEach([7.5, 10 , 15 ], id: \.self) { credit in
                        Text("\(credit)")
                            .tag(credit) // Linker "5" til 5 // String -> Int
                    }
                }
                .navigationTitle("Add Course")
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Cancel") {
                            dismiss()
                        }
                    }
                    
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Save") {
                            saveCourse()
                        }
                        .disabled(!isValid)
                    }
                }
            }
        }
    }
}

#Preview  {
    AddCourseView()
}

// Hva skal være View body?

// Vi må kunne sette title, code og credits
// Credits må kun være lov å velges som 7,5 eller 15
// Bruker må kunne lagre endringene
// Bruker må kunne kansellere hvis de ikke ønsker å opprette allikevel
// Skal ikke være lov å lage et kurs uten å sette antall credits! Og navn, og code!
// Når ferdig, lagre oppføringen i databasen, og så lukk skjermen og gå tilbake, slik at bruker ikke trykker lagre mange ganger med samme info

