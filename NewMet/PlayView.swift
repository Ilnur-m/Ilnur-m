//
//  PlayView.swift
//  NewMet
//
//  Created by Артем Галушкин on 03.09.2022.
//

import SwiftUI


struct PlayView: View {

    @State var isPlaying: Bool = false
    
    @State private var bpm: Double = 120.0
    //Длина такта
    @State private var sectionCount: Int = 4
    //Количество битов
    @State private var signatureCount: Int = 4
    //Accent
    @State var accentSignature: Array<Bool> //зависит от signatureCount
    
    
    let metronom: Metronome2 = Metronome2()
    let tapTempo: TapTempo = TapTempo()
    
    init() {
        self.accentSignature = [true, false, false, false]
        
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = .light
        
        metronom.beatListener = { (beatType: BeatType, index: Int) in
                    print("$\(beatType) - $\(index)")
                }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack(alignment: .center) {
                        SettingTaktView(sectionCount: $sectionCount,
                                        signatureCount: $signatureCount,
                                        accentSignature: $accentSignature
                        )
                        
                        BpmView(bpm: $bpm)
                        
                        PlayerView(playing: $isPlaying,
                                   actionPlay: {
                            if (!metronom.isPlaying) {
//                                print("Measures:", sectionCount)
//                                print("Signatures:", signatureCount)
//                                print("BPMs:", bpm)
//                                print("Acccent: ", accentSignature)
                                
                                var arrayNote: Array<Note> = []
    
                                
                                let note = NoteValue(rawValue: signatureCount)
//                                print("note: ", note ?? "")
                                
                                let tempoNote = NoteValue(rawValue: sectionCount)
//                                print("tempoNote: ", tempoNote ?? "")
                                
                                for index in 0...accentSignature.count - 1 {
                                    var beat: BeatType
                                    if (accentSignature[index]) {
                                        beat = BeatType.DownBeat
                                    } else {
                                        beat = BeatType.Beat
                                    }
                                    
                                    arrayNote.append(Note(
                                        value: note ?? NoteValue.Quarter, beatType: beat
                                    ))
                                }
                                
                              
                                
                                metronom.settings.audioEnabled = true
                                metronom.settings.pattern = Pattern(elements: arrayNote)
                                metronom.settings.tempo = Int(bpm)
                                metronom.settings.tempoNote = tempoNote ?? NoteValue.Eight
//                                metronom.settings.timeSignature = TimeSignature(beats: signatureCount, noteValue: NoteValue.Quarter)
                                
                            }
                            
                            metronom.toggle()
                            isPlaying = metronom.isPlaying
                            
                        }, actionSingleNote: {
                            metronom.soundSet = SoundSet.cowbell
                            if (metronom.isPlaying) {
                                metronom.start()
                            }
                        }, actionMultipleNote: {
                            metronom.soundSet = SoundSet.clave
                            if (metronom.isPlaying) {
                                metronom.start()
                            }
                        }, actionMute: {
                            metronom.settings.audioEnabled.toggle()
                            if (metronom.isPlaying) {
                                metronom.start()
                            }
                        })
                       
                        
                        Spacer()
                        MtButton(action: {
                            let temp = tapTempo.tap()
                            if (temp != 0) {
                                self.bpm = Double(temp)
                            }
                        }, text: "TAP")
                            .padding()
                        
                    }
                }
            }
            .onAppear()
            .toolbar {
                //для сохранить
//                ToolbarItem(placement: .navigationBarLeading) {
//                    Button(action: {
//
//                    }, label: {
//                        Image(systemName: "square.and.arrow.down")
//                            .foregroundColor(Color.TextColorPrimary)
//                    })
//                }
                ToolbarItem(placement: .principal) {
                    Text("METRONOME")
                        .foregroundColor(Color.TextColorPrimary)
                        .font(.subheadline)
                }
                
            }
        }
    }
}

struct PlayView_Previews: PreviewProvider {
    static var previews: some View {
        PlayView()
    }
}
