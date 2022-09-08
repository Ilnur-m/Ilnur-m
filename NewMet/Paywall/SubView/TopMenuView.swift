//
//  TopMenuView.swift
//  NewMet
//
//  Created by Артем Галушкин on 07.09.2022.
//

import SwiftUI

struct TopMenuView: View {
    @StateObject private var manager = PDFDataManager()
    @EnvironmentObject private var stateManager: StateManager
    @Binding var showSideMenu: Bool
    var body: some View {
        HStack {
          
            Text(NSLocalizedString("loc.name", comment: "VPN"))
                .font(.system(size: 18, weight: .regular)).padding(.leading,16)
            
            Spacer()
            if (manager.isPremiumUser != true) {
                Button(action: {
                    //show side menu
                    //showSideMenu = true
                    stateManager.showPaywall = true
                    //PaywallView(isPresented: $showPaywallInner)
                }, label: {
                    PremiumView()
                    .padding()
                })
            }
                       
            //PremiumView()
        }
        
    }
}

//
//struct TopMenuView_Previews: PreviewProvider {
//    static var previews: some View {
//        TopMenuView()
//    }
//}
