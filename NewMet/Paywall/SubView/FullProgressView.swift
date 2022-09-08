//
//  FullProgressView.swift
//  NewMet
//
//  Created by Артем Галушкин on 07.09.2022.
//

import SwiftUI

struct FullProgressView: View {
    var body: some View {
        ZStack {
            Color.BackgroundColor.ignoresSafeArea()
            
            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.ColorPrimary))
        }
    }
}

struct FullProgressView_Previews: PreviewProvider {
    static var previews: some View {
        FullProgressView()
    }
}
