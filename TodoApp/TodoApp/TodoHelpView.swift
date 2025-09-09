//
//  TodoHelpView.swift
//  TodoApp
//
//  Created by Håkon Bogen on 09/09/2025.
//

import SwiftUI

struct TodoHelpView: View {
    
    var todoItem: String
    
    var body: some View {
        VStack{
            Text("Todo help text: ")
                .font(.callout)
            Text(todoItem)
        }
    }
    
}

#Preview {
    TodoHelpView(todoItem: "test preview todo item")
}
