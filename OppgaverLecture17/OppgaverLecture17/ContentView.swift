//
//  ContentView.swift
//  OppgaverLecture17
//
//  Created by Håkon Bogen on 23/10/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @State var cornerRadius = 0.0
    
    @State var text: String = "im a"
    
    @State var isShowingFullScreen = false
//    @Binding var myText2: String = Binding($text)
    
    @State var hellos = ["hello 1", "hello 2 "]
    
    var body: some View {
        
        
        // A view that arranges its subviews in a vertical line.
        VStack(spacing: 5) {
            //  Creates a horizontal stack with the given spacing and vertical alignment.
     
//            NavigationView {
//                NavigationLink(
//            }
            NavigationStack {
                Text("")
            }
            
//            HStack(spacing: 0) {
//                    GeometryReader { geometry in
//                        Color.blue
//                        Text(geometry.size.width.description)
//                    
//                }
//                    .frame(width: 100, height: 44)
//                    .padding(EdgeInsets(top: 3, leading: 214, bottom: 231, trailing: 3))
//
//
//            }
            
            HStack {
                
            }
            
            Image(systemName: "globe")
                .resizable()
                .imageScale(.large)
                
                .foregroundStyle(.tint)
                .background {
                    Color.yellow
                        .cornerRadius(cornerRadius)
                        .shadow(radius: 10)
                        .animation(.easeInOut, value: cornerRadius)
//                        .animation(.easeOut, value: opacity)
                       
                    
                }
                .frame(width: 200, height: 200)
            Text("\(text)")
                .font(.custom("PG5602-font", fixedSize: 90))
                
            ScrollView {
                ForEach(0..<1000) { value in
                    ListElement()
                    
                    
                }.onAppear {
//                    cornerRadius = 1
                    
                    withAnimation(Animation.spring.delay(10)) {
                        cornerRadius = 1000
//                        opacity = 0.3
                        
                        
                    }
                }
        
            }
            .foregroundColor(.red)
         
            
            TextField("", text: $text)
            TextField("text 2", text: $text)
        }
        .padding()
        .gesture(DragGesture(), name: "drag")
//        .position(x: 200, y: 100)
        .onAppear {
            text = "edited"
            
            // Lagre verdi persisted
            UserDefaults.standard.set(false, forKey: "hasSeenOnboarding")
            
            // Hente ut
            UserDefaults.standard.object(forKey: "hasSeenOnboarding")
            
            isShowingFullScreen = false
            
//            let task = URLSession.shared.dataTask(with: )
            
//            task.resume()
            
            URLSession.shared.dataTask(with: URLRequest(url: URL(string:"http: //www.google.com/myapi.json")!)) { ata, response, error in
                
                if let error {
                    print("something wrong happened")
//                    isShowingErrorSheet = true
                }
            }
//            JSONDecoder().decode(Recipe.self, from: task)
                                                  
            
        }
        .sheet(isPresented: .constant(false)) {
            MyModalView(text: text, isShowingFullScreen: .constant(false))
//            MyView(kk$text)
        }
        
        .fullScreenCover(isPresented: $isShowingFullScreen) {
            MyModalView(text: "ehllo world", isShowingFullScreen: $isShowingFullScreen)
        }
    }
}

struct MyModalView: View {
    
    var text: String
    
    var isShowingFullScreen: Binding<Bool>
    
    init(text: String, isShowingFullScreen: Binding<Bool>) {
        self.isShowingFullScreen = isShowingFullScreen
        self.text = text
    }
    
    var body: some View {
        TabView {
            Tab {
                
                Text(text)
                VStack {
                    Text("Hello 2")
                    Button("Close screen")  {
                        //                isShowingFullScreen.wrappedValue = false
                    }
                }
                //
            }
            Tab("Tab 2", systemImage: "person") {
                Text(" Second tab")
                
            }
        }
    }
}

#Preview {
    ContentView()
}

struct ListElement: View {
    
    var body: some View {
        VStack {
            Color.red
            Text("hello wworl")
        }
        .cornerRadius(10)
        .shadow(radius: 10)
        
    }
}



struct Recipe: Codable {
    
    let name: String
    let ingredients: [String]
    
}

let json =
"""
  { 
 "name" = "Fiskepudding",
 "ingredients" = ["fisk", "mel", "vann"]

}
"""

