//
//  ContentView.swift
//  ActivityRep
//
//  Created by slava bily on 4/8/20.
//

import SwiftUI

struct ContentView: View {
    let gradient = AngularGradient(gradient: Gradient(colors: [startColor, endColor]), center: .center, startAngle: .zero, endAngle: .degrees(360 * currentPercentage))
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top, content: {
                Color.black.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        Spacer(minLength: Constants.navigationBarHeight).frame(width: geometry.size.width, height: Constants.navigationBarHeight, alignment: .top)
                        
                        self.createRings()
                        self.createCharts()
                        self.createFooter()
                    }
                }
                self.createNavigationBar(geometry.size)
            })
        }
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
