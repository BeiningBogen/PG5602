//
//  ContentView.swift
//  RatatouilleExamPractice
//
//  Created by Håkon Bogen on 30/10/2024.
//

import SwiftUI
import SwiftData
extension ModelContext {
    var sqliteCommand: String {
        if let url = container.configurations.first?.url.path(percentEncoded: false) {
            "sqlite3 \"\(url)\""
        } else {
            "No SQLite database found."
        }
    }
}
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    @AppStorage("hasSeenSplash") var hasSeenSplash = false
    
    @State var rotationAngle = 0.0
    @State var meals: [Meal] = []
    

    var body: some View {
        if hasSeenSplash == false {
            Text("Animation")
            
                .rotationEffect(.degrees(rotationAngle))
                .animation(.bouncy.speed(0.5), value: rotationAngle)
                .onAppear {
                    rotationAngle = 360
                    hasSeenSplash = true
                }
        } else {
            TabView {
                if let meal = meals.first {
                    VStack {
                        HStack {
                            Text("Navn: ")
                            Text(meal.name2)
                            
                        }
                        HStack {
                            Text("Drikkealternativ:")
                            Text(meal.drinkAlternative ?? "Vann")
                        }
                    }
                    
                    Button.init {
                        modelContext.insert(meals.first!)
                    } label: {
                        Text("Lagre favoritt")
                    }

                        
                    
                } else {
                    Text("No meals from API")
                        .tabItem {
                            Label("Home", systemImage: "")
                        }
                }
            }.onAppear {
                print(modelContext.sqliteCommand)
                // Hent oppskriftsdata
                fetchData()
            }
        }
        
    }
    
    func fetchData() {
        // Hvilken URL skal vi gå til? Hvilken HTTP-metode?
        var request = URLRequest.init(url: URL(string: "https://www.themealdb.com/api/json/v1/1/random.php")!)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = ["content-type": "application/json"]
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data  {
//                print(String.init(data: data, encoding: .utf8))
                do {
                    
                    struct MealResponse: Decodable {
                        let meals: [Meal]
                    }
                    
                    let result = try JSONDecoder().decode(MealResponse.self, from: data)
                        .meals
                    print(result.first?.name2)
                    self.meals = result
                } catch {
                    print(error)
                }
            }
//            print(response)
        }
        task.resume()
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(timestamp: Date())
            modelContext.insert(newItem)
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
