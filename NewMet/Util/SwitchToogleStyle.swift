//
//  SwitchToogleStyle.swift
//  NewMet
//
//  Created by Артем Галушкин on 05.09.2022.
//

import Foundation
import SwiftUI

struct SwitchToggleStyle: ToggleStyle {
    
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.label
            Spacer()
            Rectangle()
                .foregroundColor(configuration.isOn ? Color.ColorPrimary : Color.BackgroundColorList)
                .frame(width: 51, height: 31, alignment: .center)
                .overlay(
                    Circle()
                        .foregroundColor(Color.BackgroundColor)
                        .padding(.all, 3)
                        .offset(x: configuration.isOn ? 11 : -11, y: 0)
                        .animation(Animation.linear(duration: 0.1))
                        .shadow(color: Color.TextColorSecondary, radius: 8, x: 0, y: 3)
                        
                ).cornerRadius(20)
                .onTapGesture { configuration.isOn.toggle() }
        }
    }
    
}
