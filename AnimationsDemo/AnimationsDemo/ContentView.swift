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
                .scaleEffect(scale)
            
            Button("animate") {
                withAnimation(.spring(response: 0.6, dampingFraction: 0.5)) {
                    
                    rotation += 360
                    scale = scale == 1.0 ? 1.5 : 1.0
                }
                //                completion: {
                //
                //                }
            }
            
        }
    }
}

struct MultiplePropertiesView: View {
    @State private var isAnimated = false
    
    var body: some View {
        VStack(spacing: 40) {
            RoundedRectangle(cornerRadius: isAnimated ? 50 : 10)
                .fill(isAnimated ? .orange : .blue)
                .frame(width: isAnimated ? 200 : 100, height:  isAnimated ? 200 : 100)
                .rotationEffect(.degrees(isAnimated ? 180 : 0))
                .animation(.easeInOut(duration: 1), value: isAnimated)
            
            Button("Animate") {
                isAnimated.toggle()
            }
            
        }
    }
}

struct TransitionAnimationView: View {
    
    @State private var showDetail = false
    
    var body: some View {
        VStack(spacing: 20) {
            Button("Toggle Detail") {
                withAnimation(.spring) {
                    showDetail.toggle()
                }
            }
            
            if showDetail {
                VStack {
                    Text("Detail view")
                        .font(.title)
                    Text("This appears with transition")
                        .foregroundStyle(.secondary)
                }
                .padding()
                .background(.blue.opacity(0.2))
                .cornerRadius(10)
                .transition(.scale.combined(with: .opacity))
            }
        }
    }
}

struct GestureAnimationView: View {
    
    @State private var offset = CGSize.zero
    @State private var isDragging = false
    
    var body: some View {
        Circle()
            .frame(width: 100)
            .offset(offset)
            .fill(isDragging ? .green : .blue)
            .gesture (
                
                DragGesture()
                    .onChanged { value in
                        
                        offset = value.translation
                        isDragging = true
                    }.onEnded { _ in
                        
                        withAnimation(.spring())  {
                            offset = .zero
                            isDragging = false
                        }
                    }
            )
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
            MultiplePropertiesView()
                .tabItem { Label("Multiple properties", systemImage: "basketball")}
            TransitionAnimationView()
                .tabItem {
                    Label("Transition", systemImage: "flask")
                }
            GestureAnimationView()
                .tabItem {
                    Label("Gesture", systemImage: "shoe")
                }
        }
    }
}

#Preview {
    ContentView()
}
