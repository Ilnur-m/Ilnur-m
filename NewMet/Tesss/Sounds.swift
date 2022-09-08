//
//  Sounds.swift
//
//  Created by Roel Spruit on 16/10/15.
//  Copyright © 2015 DinkyWonder. All rights reserved.
//

import UIKit
import AudioToolbox
import AVFoundation

struct SoundSet {
    
    let downBeat: Sound
    let upBeat: Sound
    let beat: Sound
    
    static var clave = SoundSet(
        downBeat: Sound(fileName: "tick"),
        upBeat: Sound(fileName: "tock"),
        beat: Sound(fileName: "tock")
    )
    
    static var cowbell = SoundSet(
        downBeat: Sound(fileName: "bleep"),
        upBeat: Sound(fileName: "bleep"),
        beat: Sound(fileName: "bleep")
    )
    
    func soundForBeatType(beatType: BeatType) -> Sound {
        switch beatType {
            case .DownBeat: return downBeat
            case .UpBeat: return upBeat
            default: return beat
        }
    }
}

class Sound {

//    private var soundId: SystemSoundID = 0
    
    var clickPlayer: AVAudioPlayer?
//    var url: URL?
    
    let fileName: String
    
    init(fileName: String){
        self.fileName = fileName
        
//        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: "caf") {
//            AudioServicesCreateSystemSoundID(soundURL as CFURL, &soundId)
//        }
        
    }

    
    func play(){
//        AudioServicesPlaySystemSound(soundId);
     
        guard let url = Bundle.main.url(forResource: self.fileName, withExtension: "caf") else { return }
                do {
                    try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
                    try AVAudioSession.sharedInstance().setActive(true)
        
                    clickPlayer = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.caf.rawValue)
        
                    guard let clickPlayer = clickPlayer else { return }
                    clickPlayer.play()
                } catch let err {
                    print("Problem: ", err.localizedDescription)
                }
    }
    
}
