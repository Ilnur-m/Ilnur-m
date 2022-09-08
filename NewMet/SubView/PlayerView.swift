//
//  PlayerView.swift
//  NewMet
//
//  Created by Артем Галушкин on 04.09.2022.
//

import SwiftUI

struct PlayerView: View {
    
    @Binding var playing: Bool
    @State private var enableAudio: Bool = true
    let actionPlay: () -> Void
    let actionSingleNote: () -> Void
    let actionMultipleNote: () -> Void
    
    let actionMute: () -> Void
    
    var body: some View {
        HStack {
            Button(action: {
                withAnimation {
                    self.enableAudio.toggle()
                    self.actionMute()
                }
                print("button mute")
            }) {
                //
                Image(systemName: enableAudio ? "speaker.wave.3" : "speaker.slash")
                    .resizable()
                    .foregroundColor(Color.TextColorPrimary)
                    .frame(width: 32.0, height: 32.0)
            }
            .frame(width: 48, height: 48)
            
            Spacer()
            
            Button(action: {
                withAnimation {
                    self.actionPlay()
                }
                print("button music")
            }) {
                Image(systemName: playing ? "pause.fill" : "play.fill")
                    .font(.largeTitle)
                    .foregroundColor(Color.ColorPrimary)
                    .frame(width: 104, height: 104)
                    .background(Color.BackgroundColor)
            }
            .clipShape(Circle())
            .shadow(color: Color.TextColorSecondary, radius: 20, x: 16, y: 15)
            
            Spacer()
            
            MusicMenuView(actionSingleNote: actionSingleNote, actionMultipleNote: actionMultipleNote)
            .frame(width: 48, height: 48)
            
        }.padding()
    }
}

struct PlayerView_Preview: View {
    @State private var playing: Bool = false
    
    var body: some View {
        
        PlayerView(playing: $playing, actionPlay: {}, actionSingleNote: {}, actionMultipleNote: {}, actionMute: {})
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView_Preview()
    }
}
