//
//  RingTipShape.swift
//  ActivityRep
//
//  Created by slava bily on 4/8/20.
//

import SwiftUI

struct RingTipShape: Shape {
    var currentPercentage: Double
    var thickness: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let angle = CGFloat((360 * currentPercentage) * .pi / 180)
        let controllRadius: CGFloat = rect.width / 2 - thickness
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        let x = center.x + controllRadius * cos(angle)
        let y = center.y + controllRadius * sin(angle)
        let pointCenter = CGPoint(x: x, y: y)
        
        path.addEllipse(in: CGRect(x: pointCenter.x - thickness / 2, y: pointCenter.y - thickness / 2, width: thickness, height: thickness))
        
        return path
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

