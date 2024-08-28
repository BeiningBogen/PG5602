//
//  ContentView.swift
//  Forelesning1
//
//  Created by Håkon Bogen on 27/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello")

            roundedImage(.NasaPictures.crabMultiChandra4123)

            roundedImage(.NasaPictures.perseidsStonehengeDury2780)

//            Image("NasaPictures/Crab_MultiChandra_4123")




//            Rectangle()
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .foregroundColor(Color.red)
//
//            CustomShape()
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                .foregroundColor(Color.red)

//            RoundedRectangle(cornerRadius: 20)
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//            Circle()
//                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//            Ellipse()
//                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//
//            Capsule()
//                .frame(width: 200, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }

    private func roundedImage(_ resource: ImageResource) -> some View {
        return Image(resource)
            .resizable()
            .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .overlay {
                Circle().stroke(.green, lineWidth: 3)
            }
            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
            .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/, radius: 10, x: 50, y: 30)
    }
}

struct CustomShape: Shape {

    // 0,0 --------------- x,0
    //  |
    //  |
    //  |
    //  |
    //  |
    //  |
    // 0,y ---------------- x,y


    func path(in rect: CGRect) -> Path {
        var path = Path()
        UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.move(to: CGPoint(x: rect.width/2, y: rect.height/2))
        path.addArc(
            center: CGPoint(x: rect.width/2, y: rect.height/2),
            radius: 30,
            startAngle: Angle.degrees(0),
            endAngle: Angle.degrees(360),
            clockwise: true
        )
        return path
    }

}

#Preview {
    ContentView()
}

