//
//  SettingsButtonView.swift
//  NewMet
//
//  Created by Артем Галушкин on 04.09.2022.
//

import SwiftUI

struct SettingsButtonView: View {
    @Binding var isDisclosed: Bool
    let action: () -> Void
    
    var body: some View {
        ZStack(alignment: .top) {
            Button(action: {
                withAnimation {
                    self.action()
                }
                print("button settings")
            }) {
                Image(systemName: isDisclosed ?  "xmark" : "gearshape").frame(width: 24, height: 24, alignment: .center).foregroundColor(Color.TextColorPrimary)
            }.frame(width: 48, height: 48)
            GeometryReader { geometry in
                Path { path in
                    let width = geometry.size.width/2
                    path.move(to: CGPoint(x: 0, y: 10))
                    path.addLine(to: CGPoint(x: width - 60, y: 10))
                    path.addCurve(to: CGPoint(x: width, y: 50),
                                  control1: CGPoint(x: width - 20, y: 10),
                                  control2: CGPoint(x: width - 40, y: 50))
                    path.addCurve(to: CGPoint(x: width + 60, y: 10),
                                  control1: CGPoint(x: width + 40, y: 50),
                                  control2: CGPoint(x: width + 20, y: 10))
                    path.addLine(to: CGPoint(x: width * 2, y: 10))
                }
                .stroke(Color.BackgroundColorList, lineWidth: 2)
            }
        }
    }
}

struct SettingsButtonView_Preview: View {
    @State var isDisclosed = false
    var body: some View {
        SettingsButtonView(isDisclosed: $isDisclosed) {
            
        }
    }
}

struct SettingsButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsButtonView_Preview()
    }
}
