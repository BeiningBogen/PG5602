//
//  RectangeWithExtrudedCircle.swift
//  Forelesning2
//
//  Created by Edouard Siegel on 28/08/2024.
//

import SwiftUI

struct RectangeWithExtrudedCircle: Shape {

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
