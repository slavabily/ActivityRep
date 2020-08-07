//
//  ChartView.swift
//  ActivityRep
//
//  Created by slava bily on 5/8/20.
//

import SwiftUI

struct BarChartView: View {
    
    var title: String
    var progress: String
    var goal: String
    var total: String
    var average: String
    var unit: String
    var data: [Int: Double]
    var textColor: Color
    var barStartColor: Color
    var barEndColor: Color
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title)
                .font(Font.system(size: 18, weight: .regular, design: .default))
                .kerning(0.05)
                .foregroundColor(.white)
            (
                Text("\(progress)/\(goal)")
                    .font(.system(size: 28, weight: .semibold, design: .rounded))
                    .kerning(0.25)
                    .foregroundColor(textColor)
                + Text(unit)
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .kerning(0.3)
                    .foregroundColor(textColor)
            )
            .padding([.top], -3)
        }
        .padding([.bottom], 10)
        
        createChart()
            .padding([.bottom], 2)
        createLegend()
            .frame(width: Constants.barChartColumnWidth * CGFloat(Constants.barChartColumns) + Constants.barChartColumnSpacing * CGFloat(Constants.barChartColumns - 1), height: 14)
        Text("TOTAL \(total)")
            .font(.system(size: 12, weight: .regular, design: .default
            ))
            .kerning(0.3)
            .foregroundColor(textColor)
    }
    
    func createChart() -> some View {
        let maxColumnIndex = Constants.barChartColumns - 1
        
        return ZStack(alignment: .bottomLeading) {
            VStack(alignment: .center, spacing: 20) {
                HStack(alignment: .center, spacing: Constants.barChartColumnWidth) {
                    ForEach(0..<maxColumnIndex) { i in
                        Rectangle()
                            .fill(Color(red: 129 / 255, green: 129 / 255, blue: 129 / 255))
                            .frame(width: 1, height: 1)
                    }
                }
                HStack(alignment: .center, spacing: Constants.barChartColumnWidth) {
                    ForEach(0..<maxColumnIndex) { i in
                        Rectangle()
                            .fill(Color(red: 71 / 255, green: 72 / 255, blue: 73 / 255))
                            .frame(width: 1, height: 1)
                    }
                }
                HStack(alignment: .center, spacing: Constants.barChartColumnWidth) {
                    ForEach(0..<maxColumnIndex) { i in
                        Rectangle()
                            .fill(Color(red: 71 / 255, green: 72 / 255, blue: 73 / 255))
                            .frame(width: 1, height: 1)
                    }
                }
                HStack(alignment: .top, spacing: Constants.barChartColumnSpacing) {
                    ForEach(0..<maxColumnIndex) { i in
                        Rectangle()
                            .fill(self.barStartColor)
                            .frame(width: Constants.barChartColumnWidth, height: Constants.barChartColumnWidth)
                            .cornerRadius(Constants.barChartColumnWidth / 2)
                    }
                }
            }
            
            HStack(alignment: .bottom, spacing: Constants.barChartColumnSpacing) {
                ForEach(0..<maxColumnIndex) { i in
                    BarChartBarView(height: data[i] ?? Double(0), startColor: barStartColor, endColor: barEndColor)
                }
            }
            .drawingGroup()
            
            VStack {
                Text("\(average)\(unit)")
                    .font(.system(size: 11, weight: .medium, design: .default))
                    .foregroundColor(.chartLegendText)
                    .padding([.top], 2)
                Spacer()
            }
        }
    }
    
    func createLegend() -> some View {
        HStack(alignment: .center) {
            createLegendItem("00:00")
            Spacer()
            createLegendItem("06:00")
            Spacer()
            createLegendItem("12:00")
            Spacer()
            createLegendItem("18:00")
        }
    }
    
    func createLegendItem(_ time: String) -> some View {
        Text(time)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            .font(.system(size: 11, weight: .medium, design: .default))
            .foregroundColor(.chartLegendText)
    }
}

struct BarChartBarShape: Shape {
    var height: Double
    var currentHeight: Double
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let cornerRadius = Constants.barChartColumnWidth / 2
        path.addRoundedRect(in: CGRect(x: 0, y: CGFloat(height - currentHeight), width: Constants.barChartColumnWidth, height: CGFloat(currentHeight)), cornerSize: CGSize(width: cornerRadius, height: cornerRadius))
        return path
    }
    
    var animatableData: Double {
        get {
            return currentHeight
        }
        set {
            currentHeight = newValue
        }
    }
}

struct BarChartBarView: View {
    
    @State var currentHeight: Double = 0
    
    var height: Double
    var startColor: Color
    var endColor: Color
    
    var animation: Animation {
        .easeInOut(duration: 0.5)
    }
    
    var body: some View {
        BarChartBarShape(height: height, currentHeight: currentHeight)
            .fill(LinearGradient(gradient: Gradient(colors: [startColor, endColor]), startPoint: .bottom, endPoint: .top))
            .frame(width: Constants.barChartColumnWidth, height: CGFloat(height))
            .onAppear() {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation(animation) {
                        currentHeight = height
                    }
                }
            }
    }
    
}


 
