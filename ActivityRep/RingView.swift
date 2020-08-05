//
//  RingView.swift
//  ActivityRep
//
//  Created by slava bily on 5/8/20.
//

import SwiftUI

struct RingView: View {
    @State var currentPercentage: Double = 0
    
    var percentage: Double
    var backgroundColor: Color
    var startColor: Color
    var endColor: Color
    var thickness: CGFloat
    
    var animation: Animation {
        Animation.easeInOut(duration: 1)
    }
    
    var body: some View {
        let gradient = AngularGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startAngle: .degrees(0), endAngle: .degrees(360 * currentPercentage))
        
        return ZStack {
            RingBackgroundShape(thickness: thickness)
                .fill(backgroundColor)
            RingShape(currentPercentage: currentPercentage, thickness: thickness)
                .fill(gradient)
                .rotationEffect(.degrees(-90))
                .shadow(radius: 2)
                .drawingGroup()
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        withAnimation(animation) {
                            currentPercentage = percentage
                        }
                    }
                }
            RingTipShape(currentPercentage: currentPercentage, thickness: thickness)
                .fill(currentPercentage > 1 ? endColor : .clear)
                .rotationEffect(.degrees(-90))
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        currentPercentage = percentage
                    }
                }
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(percentage: 50, backgroundColor: Color.gray, startColor: .white, endColor: .red, thickness: 5)
    }
}
