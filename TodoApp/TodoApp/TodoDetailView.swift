//
//  TodoDetailView.swift
//  TodoApp
//
//  Created by Håkon Bogen on 09/09/2025.
//

import SwiftUI

struct TodoDetailView: View {
    
    init(todoItem: String) {
        self.todoItem = todoItem
    }
    
    var todoItem: String
    
    @State var isShowingSheet = false
    
    func didTapQuestionMark() {
        isShowingSheet = true
        // isShowingSheet.toggle()
    }
    
    var body: some View {
        VStack {
            Text(todoItem)
            Button {
                didTapQuestionMark()
            } label: {
                Image(systemName: "questionmark")
            }

        }.sheet(isPresented: $isShowingSheet) {
            // return et View
            TodoHelpView(todoItem: todoItem)
            
        }
    }
}

#Preview {
    TodoDetailView(todoItem: "Test todo item")
}
