//
//  BpmView.swift
//  NewMet
//
//  Created by Артем Галушкин on 03.09.2022.
//

import SwiftUI

struct BpmView: View {
    
    @Binding var bpm: Double
    @State private var minBpm: Double = 30
    @State private var maxBmp: Double = 244
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        if (bpm > minBpm) {
                            bpm = bpm - 1
                        }
                    }
                    print("button minus")
                }) {
                    Image(systemName: "minus")
                        .resizable()
                        .frame(width: 32.0, height: 3.0)
                        .foregroundColor(Color.TextColorPrimary)
                }
                .frame(width: 48, height: 48)
                
                HStack {
                Text("\(Int(bpm))")
                    .animatableFont(size: 56, weight: .light )
                    .frame(maxWidth: .infinity, alignment: .center)
                }
                Button(action: {
                    withAnimation {
                        if (bpm < maxBmp) {
                            bpm = bpm + 1
                        }
                    }
                    print("button plus")
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(Color.TextColorPrimary)
                        .frame(width: 32.0, height: 32.0)
                }
                .frame(width: 48, height: 48)
                Spacer()
            }
            
            Text("BPM")
                .animatableFont(size: 15, weight: .regular )
                .frame(height: 17, alignment: .center)
                .foregroundColor(Color.TextColorSecondary)
            
            Spacer()
            Spacer()
            
            SliderView(value: $bpm,
                       sliderRange: minBpm...maxBmp,
                       thumbColor: Color.BackgroundColor,
                       minTrackColor: Color.ColorPrimary,
                       maxTrackColor: Color.BackgroundColorList)
        }
        .padding()
    }
}

struct BpmView_Preview: View {
    @State private var bpm: Double = 60.0
    
    var body: some View {
        BpmView(bpm: $bpm)
    }
}

struct BpmView_Previews: PreviewProvider {
    
    static var previews: some View {
        BpmView_Preview()
    }
}
