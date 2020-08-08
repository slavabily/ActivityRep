//
//  RingShape.swift
//  ActivityRep
//
//  Created by slava bily on 4/8/20.
//

import SwiftUI

struct RingShape: Shape {
    var currentPercentage: Double
    var thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.width / 2, y: rect.height / 2), radius: rect.height / 2 - thickness, startAngle: .zero, endAngle: .degrees(360 * currentPercentage), clockwise: false)
        
        return path
            .strokedPath(StrokeStyle(lineWidth: thickness, lineCap: .round, lineJoin: .round))
    }
    
    var animatableData: Double {
        get {
            currentPercentage
        }
        set {
            currentPercentage = newValue
        }
    }
}

 
