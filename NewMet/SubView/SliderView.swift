//
//  SliderView.swift
//  NewMet
//
//  Created by Артем Галушкин on 04.09.2022.
//

import SwiftUI

struct SliderView: View {
    @Binding var value: Double
    
    @State var lastCoordinateValue: CGFloat = 0.0
    var sliderRange: ClosedRange<Double> = 1...100
    var thumbColor: Color = .yellow
    var minTrackColor: Color = .blue
    var maxTrackColor: Color = .gray
    
    var body: some View {
        GeometryReader { gr in
            let thumbWidth = gr.size.width * 0.03
            let radius: CGFloat = 23
            let minValue = gr.size.width * 0.0
            let maxValue = (gr.size.width * 0.95) - thumbWidth
            
            let scaleFactor = (maxValue - minValue) / (sliderRange.upperBound - sliderRange.lowerBound)
            let lower = sliderRange.lowerBound
            let sliderVal = (self.value - lower) * scaleFactor + minValue
            
            ZStack {
                Rectangle()
                    .foregroundColor(maxTrackColor)
                    .frame(width: gr.size.width, height: 2)
                    .clipShape(RoundedRectangle(cornerRadius: radius))
                HStack {
                    Rectangle()
                        .foregroundColor(minTrackColor)
                    .frame(width: sliderVal, height: 2)
                    Spacer()
                }
                .clipShape(RoundedRectangle(cornerRadius: radius))
                HStack {
                    RoundedRectangle(cornerRadius: radius)
                        .foregroundColor(thumbColor)
                        .frame(width: 40, height: 20)
                        .offset(x: sliderVal)
                        .shadow(color: .gray, radius: 10, x: 3, y: 2)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    if (abs(v.translation.width) < 0.1) {
                                        self.lastCoordinateValue = sliderVal
                                    }
                                    if v.translation.width > 0 {
                                        let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor)  + lower
                                    } else {
                                        let nextCoordinateValue = max(minValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                    }
                               }
                        )
                    Spacer()
                }
            }
        }
    }
}

struct SliderView3: View {
    @State private var currentValue1 = 30.0
        
        var body: some View {
            VStack(spacing:20) {
                Text("Custom Slider")
                    .font(.title2)
                    .fontWeight(.bold)
                
                VStack(spacing:0) {
                    Text("value 1 = \(currentValue1, specifier: "%.2F")")
                    SliderView(value: $currentValue1,
                                sliderRange: 30...244,
                               thumbColor: Color.BackgroundColor,
                               minTrackColor: Color.ColorPrimary,
                               maxTrackColor: Color.BackgroundColorList)
                        .frame(width:300, height:30)
                }
            }
        }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView3()
    }
}
