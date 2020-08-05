//
//  ContentView.swift
//  ActivityRep
//
//  Created by slava bily on 4/8/20.
//

import SwiftUI

struct ContentView: View {
    
    func createRings() -> some View {
        ZStack {
            RingView(
                percentage: ActivityData.ringsPercentage.standPercentage,
                backgroundColor: Color.standRingBackground,
                startColor: Color.standRingStartColor,
                endColor: Color.standRingEndColor,
                thickness: Constants.mainRingThickness)
                .frame(width: 150, height: 150)
                .aspectRatio(contentMode: .fit)
            
            RingView(
                percentage: ActivityData.ringsPercentage.exercisePercentage,
                backgroundColor: Color.exerciseRingBackground,
                startColor: Color.exerciseRingStartColor,
                endColor: Color.exerciseRingEndColor,
                thickness: Constants.mainRingThickness
            )
            .frame(width: 215, height: 215)
            .aspectRatio(contentMode: .fit)
            
            RingView(
                percentage: ActivityData.ringsPercentage.movePercentage,
                backgroundColor: Color.moveRingBackground,
                startColor: Color.moveRingStartColor,
                endColor: Color.moveRingEndColor,
                thickness: Constants.mainRingThickness
            )
            .frame(width: 280, height: 280)
            .aspectRatio(contentMode: .fit)
        }
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .top, content: {
                Color.black.edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack {
                        Spacer(minLength: Constants.navigationBarHeight).frame(width: geometry.size.width, height: Constants.navigationBarHeight, alignment: .top)
                        
                        self.createRings()
//                        self.createCharts()
//                        self.createFooter()
                    }
                }
//                self.createNavigationBar(geometry.size)
            })
        }
         
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
