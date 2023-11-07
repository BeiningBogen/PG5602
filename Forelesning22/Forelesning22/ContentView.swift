//
//  ContentView.swift
//  Forelesning22
//
//  Created by Håkon Bogen on 07/11/2023.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \School.name, ascending: true)],
        animation: .default)
    private var schools: FetchedResults<School>

    var body: some View {
        NavigationView {
            List {
                ForEach(schools) { school in
                    NavigationLink {
                        Text("school \(school.name!)")
                    } label: {
                        Text(school.name!)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button {
                        getSchools()
                    } label: {
                        Text("Hent skoler")
                    }

                }
            }
            Text("Select an item")
        }
    }
    
    func getSchools() {
        Task {
            let url = URL(string: "https://raw.githubusercontent.com/BeiningBogen/PG5602/master/schools.json")
            
            var urlRequest = URLRequest(url: url!)
            urlRequest.httpMethod = "GET"
            urlRequest.allHTTPHeaderFields = ["accept" : "application/json"]
            do {
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                
                let stringValue = String.init(data: data, encoding: .utf8)
                print(stringValue)
                let schools = try JSONDecoder().decode([School].self, from: data)
                
                try PersistenceController.shared.container.viewContext.save()
                
            } catch let error {
                
                print(error)
                
            }
        }
        
    }
    
    func getTeachers() {
        Task {
            do {
                let urlRequest = URLRequest.init(url: URL(string: "https://raw.githubusercontent.com/BeiningBogen/PG5602/master/teachers.json")!)
                let (data, response) = try await URLSession.shared.data(for: urlRequest)
                let result = try JSONDecoder().decode([Teacher].self, from: data)
            } catch let error {
                
            }
        }
    }

  

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { schools[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext).onAppear {
            
        }
    }
}
