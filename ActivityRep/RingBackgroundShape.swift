//
//  RingBackgroundShape.swift
//  ActivityRep
//
//  Created by slava bily on 4/8/20.
//

import SwiftUI

struct RingBackgroundShape: Shape {
    var thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.width / 2, y: CGFloat(rect.height / 2)), radius: rect.width / 2 - thickness, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 360), clockwise: false)
        
        return path
            .strokedPath(StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
}

