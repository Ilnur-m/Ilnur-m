//
//  MusicMenuView.swift
//  NewMet
//
//  Created by Артем Галушкин on 06.09.2022.
//

import SwiftUI

struct MusicMenuView: View {
    let actionSingleNote: () -> Void
    let actionMultipleNote: () -> Void
    
    var body: some View {
        
        Menu {
            Button("Multiple", action: actionMultipleNote).padding()
            Button("Single", action: actionSingleNote).padding()
        } label: {
            Label {} icon: {
                Image(systemName: "music.note.list")
                    .resizable()
                    .foregroundColor(Color.TextColorPrimary)
                    .frame(width: 32, height: 32.0)
            }
        }
    }

}

struct MusicMenuView_Previews: PreviewProvider {
    static var previews: some View {
        MusicMenuView(actionSingleNote: {}, actionMultipleNote: {})
    }
}
