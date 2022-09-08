//
//  PremiumView.swift
//  NewMet
//
//  Created by Артем Галушкин on 07.09.2022.
//

import SwiftUI

struct PremiumView: View {
    var fillRect = true
    var body: some View {
        ZStack {
            if fillRect {
                RoundedRectangle(cornerRadius: 20.0)
                    .fill(Color.accentColor)
                    .frame(width: 135, height: 40)
            } else {
                RoundedRectangle(cornerRadius: 20.0)
                    .stroke(Color.accentColor)
                    .frame(width: 135, height: 40)
            }
            
            HStack {
                Image(systemName: "flame.fill")
                Text("GO PREMIUM")
                    .font(.system(size: 12, weight: .regular))
            }
        }
    }
}


struct PremiumView_Previews: PreviewProvider {
    static var previews: some View {
        PremiumView()
    }
}
