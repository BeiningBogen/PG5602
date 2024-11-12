//
//  ContentView.swift
//  Testproject141
//
//  Created by Håkon Bogen on 12/11/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [Item]
    
    @State var coffees: [Coffee] = []
    
    var isRunningPreview = false

    var body: some View {
        List {
            ForEach(coffees) { coffee in
                HStack {
                    AsyncImage(url: coffee.imageURL) { image in
                        image.resizable()
                            .frame(width: 90, height: 90)
                            .cornerRadius(30)
                    } placeholder: {
                        Color.red.frame(width: 90, height: 90).cornerRadius(30)
                    }

                    
                    
                    Text(coffee.title)
                }
            }
        }
            .onAppear {
                // Utfør jobben på bakgrunnstråd
                Task {
                    await fetchData()
                }
            }
    }
    /// Async/await = utfør en og en linje kode
    func fetchData() async {
        
        // PSEUDO CODE:::
        /// Hent kaffe  fra DB, før du gjør api-kall
//        if Coffee.fetchInDatabase().count > 0 {
//            coffees = Coffee.fetchInDatabase()
//            return
//        } /// End PSEUDO CODE
        
        if isRunningPreview {
            self.coffees = [Coffee(title: "Espresso", coffeeDescription: "Black no milk", ingredients: ["Coffee", "water"], imageURL: .applicationDirectory, id: 9)]
            return
        }
        
        let urlRequest = URLRequest(url: URL(string: "https://api.sampleapis.com/coffee/hot")!)
        do {
            let (data, response) = await try URLSession.shared.data(for: urlRequest)
            
            print(response)
            print(String(data: data, encoding: .utf8))
            let coffees = try JSONDecoder().decode([Coffee].self, from: data)
            /// PSEUDO CODE
            /// Insert coffess til DB
            /// Copied from hackwithswift/coffeetoturial.html
          //  for coffee in coffees  {
          //      coffee.insertInDatabase()
          //  }
            self.coffees = coffees
        } catch {
            print(error)
        }
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
    ContentView(isRunningPreview: true)
        
        .modelContainer(for: Item.self, inMemory: true)
}
