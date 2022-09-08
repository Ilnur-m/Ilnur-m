//
//  MtButton.swift
//  NewMet
//
//  Created by Артем Галушкин on 01.09.2022.
//

import SwiftUI

struct GrowingButton: ButtonStyle {
    @Binding var enable: Bool
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 100, minHeight: 48)
            .padding()
            .overlay(
                RoundedRectangle(
                    cornerRadius: 16,
                    style: .circular
                ).stroke(enable ? Color.ColorPrimary : Color.TextColorSecondary, lineWidth: 2)
            )
            .scaleEffect(configuration.isPressed ? 0.8 : 1)
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
    }
}


struct MtButton: View {
    
    let action: () -> Void
    @Binding var enable: Bool
    var text: String
    
    init(action: @escaping () -> Void, enable: Binding<Bool> = .constant(true), text: String) {
        _enable = enable
        self.action = action
        self.text = text
    }
    
    var body: some View {
        Button(action: {
            withAnimation {
                self.action()
            }
        }) {
            Text(text)
                .foregroundColor(enable ? Color.TextColorPrimary : Color.TextColorSecondary)
                .fontWeight(.regular)
                .frame(minWidth: 0, maxWidth: .infinity)
        }
        .buttonStyle(GrowingButton(enable: $enable))
    }
}

struct MtButton_Previews: PreviewProvider {
    static var previews: some View {
        MtButton(action: {}, text: "test")
    }
}
