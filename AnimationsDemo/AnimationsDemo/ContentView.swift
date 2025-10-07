//
//  ContentView.swift
//  AnimationsDemo
//
//  Created by Håkon Bogen on 07/10/2025.
//

import SwiftUI

struct BasicAnimationView: View {
    
    @State var isExpanded = false
    
    var body: some View {
        
        
        VStack {
            Circle()
                .fill(.blue)
                .frame(width: isExpanded ? 200 : 100)
                .animation(.default, value: isExpanded)
            
            Button("Animate") {
                isExpanded.toggle()
            }
        }
    }
}

struct AnimationTypesView: View {
    
    @State private var offset: CGFloat = 0
    
    var body: some View {
        VStack(spacing: 30) {
            Circle()
                .fill(.red)
                .frame(width: 50)
                .offset(x: offset)
                .animation(.linear(duration: 2), value: offset)
            
            Circle()
                .fill(.green)
                .frame(width: 50)
                .offset(x: offset)
                .animation(.easeInOut(duration: 1), value: offset)
            
            Circle()
                .fill(.blue)
                .frame(width: 50)
                .offset(x: offset)
                .animation(.spring(response: 0.9, dampingFraction: 0.1), value: offset)
            
            Button("Animate") {
//                offset = 45
                offset = (offset == -150) ? 150 : -150
            }
        }
    }
}

struct ExplicitAnimationView: View {
    
    @State var rotation: Double = 0
    @State var scale: CGFloat = 1.0
    
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: 20)
                .fill(.purple)
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(rotation))
        
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            BasicAnimationView()
                .tabItem {
                    Label("Basic animation", systemImage: "person")
                }
            AnimationTypesView()
                .tabItem {
                    Label("Animation types", systemImage: "football")
                }
            ExplicitAnimationView()
                .tabItem {
                    Label("Explicit animation", systemImage: "square")
                }
        }
    }
}

#Preview {
    ContentView()
}
