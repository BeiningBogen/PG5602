//
//  ContentView.swift
//  TodoApp
//
//  Created by Håkon Bogen on 09/09/2025.
//

import SwiftUI

struct TodoListView: View {
    
    
    @State private var todoItems: [TodoItem] = [
        TodoItem(text: "Lære Swift", helpText: "Ta kurset PG5602"),
        TodoItem(text: "Publisere appen på App Store", helpText: "Gå til appstoreconnect.com og lag konto")
    ]
    
    @State private var todos = ["Lære Swift", "Publisere appen på app store", "Profit"]
    
    @State private var newTodoText: String = ""
    
    func didTapButton() -> Void {
        if newTodoText.isEmpty == false {
            todos.append(newTodoText)
            newTodoText = ""
        }
        
    }
    
    func deleteTodo(offset: IndexSet)  {
        print("todos before \(todos)")
        todos.remove(atOffsets: offset)
        print("todos after \(todos)")
    }
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Add todo", text: $newTodoText)
                
                Button {
                    didTapButton()
                } label: {
                    //
                    Text("Legg til")
                }

                List {
                    ForEach(todos, id: \.self) { todo in
                        
                        NavigationLink {
                            
                            TodoDetailView(todoItem: todo)
                            /// TodoHelpView vises herfra
                            
                           /// IKKE GJØR dette
                            // let todoDetail = TodoDetailView()
                            // todoDetail.todoItem = todo
                            
                        } label: {
                            Label(todo, systemImage: "pencil")
                        }

                    }
                    .onDelete(perform: deleteTodo)
                }
            }
            .padding()
        }
    }
}

#Preview {
    TodoListView()
}
