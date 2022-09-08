

import SwiftUI

struct TunerView: View {
    @EnvironmentObject var viewlaunch: ViewLaunch
    @EnvironmentObject var manager: PDFDataManager

    @ObservedObject private var tunerController: TunerController = TunerController()
    @AppStorage("modifierPreference") private var modifierPreference = ModifierPreference.preferSharps
    @AppStorage("selectedTransposition") private var selectedTransposition = 0
    private var tunerData: TunerData { tunerController.data }
    
    var body: some View {
        
        NavigationView {
//            ZStack {
//                LinearGradient(gradient: Gradient(
//                    colors: [Color("backgroundColor"), Color("mainColor2")]),
//                    startPoint: .top, endPoint: .bottom
//                )
//                .ignoresSafeArea()
                
                VStack(alignment: .noteCenter, spacing: 15) {
//                    HStack {
//                        TranspositionMenu(selectedTransposition: $selectedTransposition)
//                            .padding()
//                        
//                        Spacer()
//                    }
//                    .frame(maxHeight: 150)

                    MatchedNoteView(
                        match: tunerData.closestNote.inTransposition(ScaleNote.allCases[selectedTransposition]),
                        modifierPreference: modifierPreference
                    )
                    .onTapGesture {
                        modifierPreference = modifierPreference.toggled
                    }

                    MatchedNoteFrequency(frequency: tunerData.closestNote.frequency)

                    NoteDistanceMarkers()
                        .overlay(
//                            VStack {
                                CurrentNoteMarker(
                                    frequency: tunerData.pitch,
                                    distance: tunerData.closestNote.distance
                                )
//
//                                Text(tunerData.pitch.localizedString())
//                                    .font(.system(.title2, design: .monospaced))
//                                    .font(.system(size: 20))
//                                    .foregroundColor(Color.TextColorPrimary)
//                            }
                        )

                    Spacer()
                        .frame(maxHeight: 500)
                }
//                .onAppear(perform: tunerController.start)
                .onAppear(perform: {
                    if (!self.manager.isPremiumUser) {
                        self.viewlaunch.currentPage = "PaywallView"
                    } else {
                        tunerController.checkMicrophoneAuthorizationStatus()
                    }
                    
                })
                .onDisappear(perform: tunerController.stop)
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        Text("TUNER")
                            .foregroundColor(Color.TextColorPrimary)
                            .font(.subheadline)
                    }
                    
                }
                .alert(isPresented: $tunerController.showMicrophoneAccessAlert) {
                    Alert(
                        title: Text("No microphone access"),
                        message: Text(
                            """
                            Please grant microphone access in the Settings app in the "Privacy ⇾ Microphone" section.
                           """
                        )
                    )
                }
            }
//        .onAppear(perform: {
//
//            })
        }
}

struct TunerView_Previews: PreviewProvider {
    static var previews: some View {
        TunerView()
    }
}
