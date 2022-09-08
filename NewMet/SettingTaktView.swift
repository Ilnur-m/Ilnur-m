//
//  SettingTaktView.swift
//  NewMet
//
//  Created by Артем Галушкин on 31.08.2022.
//

import SwiftUI

struct SettingTaktView: View {
    
    private let defaultSectionCount: Int = 4
    private let defaultSignatureCount: Int = 4
    
    @State private var isDisclosed = false
    //длина такта
    @Binding var sectionCount: Int
    //количество тактов
    @Binding var signatureCount: Int
    
    @Binding var accentSignature: Array<Bool>
    
    @State private var small = false
    
    init(sectionCount: Binding<Int>, signatureCount: Binding<Int>, accentSignature: Binding<Array<Bool>>) {
        self._sectionCount = sectionCount
        self._signatureCount = signatureCount
        self._accentSignature = accentSignature
    }
    
    var body: some View {
        VStack(spacing: 0) {
            
            Text("\(signatureCount)/\(sectionCount)")
                .animatableFont(size: isDisclosed ? 28 : 19, weight: .regular )
                .frame(maxWidth: .infinity, alignment: .center)
            
            HStack {
                Spacer()
                
                Button(action: {
                    withAnimation {
                        if (signatureCount > 1) {
                            signatureCount = signatureCount - 1
                        }
                    }
                    print("button minus")
                }) {
                    Image(systemName: "minus")
                        .resizable()
                        .foregroundColor(Color.TextColorPrimary)
                        .frame(width: 32.0, height: 3)
                }
                .frame(width: 48, height: 48)
                
                Button(action: {
                    withAnimation {
                        if (signatureCount < 12) {
                            signatureCount = signatureCount + 1
                            //                            accentSignature.append(false)
//                        }
                        while (accentSignature.count > signatureCount) {
                            accentSignature.removeLast()
                        }
                        
                        accentSignature.append(false)
                        }
                    }
                    print("button pressed")
                }) { Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(Color.TextColorPrimary)
                        .frame(width: 32.0, height: 32.0)
                }
                .frame(width: 48, height: 48)
                
                Spacer()
                
                Button(action: {
                    withAnimation {
                        
                        if (sectionCount > 1) {
                            sectionCount = sectionCount - 1
                            
                        }
//                        if (sectionCount < signatureCount) {
//                            signatureCount = signatureCount - 1
//                            //                            accentSignature.removeLast()
//                        }
                    }
                    print("button pressed")
                }) {
                    Image(systemName: "minus")
                        .resizable()
                        .foregroundColor(Color.TextColorPrimary)
                        .frame(width: 32.0, height: 3.0)
                }
                .frame(width: 48, height: 48)
                
                Button(action: {
                    if (sectionCount < 12) {
                        sectionCount = sectionCount + 1
//                        while (accentSignature.count > signatureCount) {
//                            accentSignature.removeLast()
//                        }
//
//                        accentSignature.append(false)
                    }
                    
                    print("button pressed")
                }) {
                    Image(systemName: "plus")
                        .resizable()
                        .foregroundColor(Color.TextColorPrimary)
                        .frame(width: 32.0, height: 32.0)
                }
                .frame(width: 48, height: 48)
                
                Spacer()
            }
            .frame(height: isDisclosed ? nil : 0, alignment: .top)
            .clipped()
            
            Text("Time signature")
                .animatableFont(size: 11, weight: .light)
                .foregroundColor(Color.TextColorSecondary)
                .frame(height: isDisclosed ? nil : 0, alignment: .center)
                .clipped()
                .padding()
            
            // открыто и больше 6
            if (isDisclosed && signatureCount > 6) {
                VStack (spacing: 23) {
                    HStack (spacing: 23) {
                        ForEach(0..<6, id: \.self) { index in
                            Circle()
                                .fill(accentSignature[index] ? Color.ColorPrimary : Color.BackgroundColorList) // 2
                                .scaleEffect(1)
                                .frame(width: 25, height: 25)
                                .transition(AnyTransition.opacity.combined(with: .scale)) // 3
                                .id(index) // 4
                                .onTapGesture {
                                    withAnimation {
                                        accentSignature[index] = !accentSignature[index]
                                    }
                                    
                                }
                        }
                    }
                    
                    HStack (spacing: 23) {
                        ForEach(0..<signatureCount - 6, id: \.self) { index in
                            Circle()
                                .fill(accentSignature[index + 6] ? Color.ColorPrimary : Color.BackgroundColorList) // 2
                                .scaleEffect(1)
                                .frame(width: 25, height: 25)
                                .transition(AnyTransition.opacity.combined(with: .scale)) // 3
                                .id(index+6) // 4
                                .onTapGesture {
                                    withAnimation {
                                        accentSignature[(index + 6)] = !accentSignature[index + 6]
                                    }
                                    
                                }
                        }
                    }
                    
                }
                .transition(AnyTransition.opacity.combined(with: .scale))
            } else {
                // закрыто и больше 6
                if (!isDisclosed && signatureCount > 6) {
                    HStack {
                        HStack {
                            ForEach(0..<6, id: \.self) { index in
                                Circle()
                                    .fill(accentSignature[index] ? Color.ColorPrimary : Color.BackgroundColorList) // 2
                                    .scaleEffect(1)
                                    .frame(width: 10, height: 10)
                                    .transition(AnyTransition.opacity.combined(with: .scale)) // 3
                                    .id(index) // 4
                            }
                        }
                        
                        HStack {
                            ForEach(0..<signatureCount - 6, id: \.self) { index in
                                Circle()
                                    .fill(accentSignature[index + 6] ? Color.ColorPrimary : Color.BackgroundColorList) // 2
                                    .scaleEffect(1)
                                    .frame(width: 10, height: 10)
                                    .transition(AnyTransition.opacity.combined(with: .scale)) // 3
                                    .id(index+6) // 4
                                
                            }
                        }
                        
                    }.transition(AnyTransition.opacity.combined(with: .scale))
                } else {
                    //меньше 6 и открыто или закрыто
                    HStack (spacing: 23) {
                        ForEach(0..<signatureCount, id: \.self) { index in
//                            if (accentSignature.count < signatureCount) {
                            Circle()
                                .fill(accentSignature[index] ? Color.ColorPrimary : Color.BackgroundColorList) // 2
                                .scaleEffect(1)
                                .frame(width: isDisclosed ? 25 : 10, height: isDisclosed ? 25 : 10)
                                .transition(AnyTransition.opacity.combined(with: .scale)) // 3
                                .id(index) // 4
                                .onTapGesture {
                                    if (isDisclosed) {
                                        withAnimation {
                                            accentSignature[index] = !accentSignature[index]
                                        }
                                    }
                                }
//                            }
                        }
                    }.transition(AnyTransition.opacity.combined(with: .scale))
                }
                
            }
            
            Text("Tap to choose beat type")
                .animatableFont(size: 11, weight: .light)
                .foregroundColor(Color.TextColorSecondary)
                .frame(height: isDisclosed ? nil : 0, alignment: .center)
                .clipped()
                .padding()
            
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    
                    MtButton(action: {
                        sectionCount = defaultSectionCount
                        signatureCount = defaultSignatureCount
                        for index in 0...accentSignature.count - 1 {
                            accentSignature[index] = false
                        }
                    }, enable: getResetEnable(), text: "RESET")
                    
                    Spacer()
                    Spacer()
                    
                    MtButton(action: {
                        isDisclosed = !isDisclosed
                        while (accentSignature.count > signatureCount) {
                            accentSignature.removeLast()
                        }
                    }, text: "CONFIRM")
                    
                    Spacer()
                }.padding()
                
                Spacer()
            }
            .frame(height: isDisclosed ? nil : 0, alignment: .top)
            .clipped()
            
            
            SettingsButtonView(isDisclosed: $isDisclosed) {
                isDisclosed.toggle()
                while (accentSignature.count > signatureCount) {
                    accentSignature.removeLast()
                }
            }
            
        }
        
    }
    
    func getResetEnable() -> Binding<Bool> {
        
        return Binding(get: {
            return (defaultSectionCount != sectionCount || defaultSignatureCount != signatureCount)
        }, set: {_ in })
    }
}




struct SettingTaktView_Preview: View {
    //количество тактов
    @State private var sectionCount: Int = 8
    //числитель (хуй знает что это такое)
    @State private var signatureCount = 8
    //accent sound
    @State var accentSignature: Array<Bool> = Array(repeating: false, count: 4)
    
    var body: some View {
        SettingTaktView(sectionCount: $sectionCount, signatureCount: $signatureCount, accentSignature: $accentSignature)
    }
}

struct SettingTaktView_Previews: PreviewProvider {
    static var previews: some View {
        SettingTaktView_Preview()
            .previewDevice("iPhone 13 Pro")
    }
}

///Для изменения размера текста
extension View {
    func animatableFont(size: Double,
                        weight: Font.Weight,
                        design: Font.Design = .default) -> some View {
        self.modifier(AnimatableFontModifier(size: size,
                                             weight: weight,
                                             design: design))
    }
}

struct AnimatableFontModifier: AnimatableModifier {
    var size: Double
    var weight: Font.Weight = .regular
    var design: Font.Design = .default
    
    var animatableData: Double {
        get { size }
        set { size = newValue }
    }
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}
///-------------------------------

