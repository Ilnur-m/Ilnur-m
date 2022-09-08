//
//  HomeView.swift
//  PDFScanner
//
//  Created by lk on 08.04.2022.
//

import SwiftUI


struct HomeView: View {
    @State var showSideMenu = false
    @EnvironmentObject private var stateManager: StateManager
    @State var showError = false
    
    //@State var speedSimulator = StateManager()
    //@Binding var showPaywall : Bool
    
    @StateObject private var manager = PDFDataManager()
    
    var body: some View {
        ZStack {
            Color.BackgroundColor
                .ignoresSafeArea()
            
            VStack {
//                DashboardContentView().environmentObject(manager)
//                if (stateManager.showPaywall == false) {
//                    //Spacer()
//                    //Text("Home View")
//                    DashboardContentView().environmentObject(manager)
//                }
//                // Show Paywall
//                else {
//                    PaywallView(isPresented: $showSideMenu).environmentObject(stateManager)
//                }
                
            }
            .foregroundColor(.white)
            //.padding(.horizontal)
            
            VStack {
                Spacer()
                // drop down view
                if (stateManager.showPaywall == false) {
                    //DropdownView()
                       
                }
            }
            //.padding(.horizontal, 32)
            
        }.onAppear(perform:{
            if (manager.isPremiumUser == false && manager.showedPerSession == false) {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    //stateManager.showPaywall = true;
                    manager.showPaywall = true
                    manager.showedPerSession = true;
                }
            }
        })
    }
 
}


struct HomeView_Preview: View {
    @StateObject var stateManager = StateManager(showPaywall: false)
    var body: some View {
        HomeView().environmentObject(stateManager)
    }
}

struct HomeView_Previews: PreviewProvider {

    static var previews: some View {
        HomeView_Preview()
    }
}



