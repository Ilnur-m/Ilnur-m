//
//  SettingsView.swift
//  NewMet
//
//  Created by Sean on 10/7/21.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    @EnvironmentObject var viewlaunch: ViewLaunch
    
//    @State private var flashlight = false
    
    //    equestReview) var requestReview
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 50) {
                
                //                Toggle(isOn: $flashlight) {
                //                    HStack {
                //                        Image(systemName: "sun.max")
                //                            .foregroundColor(Color.ColorPrimary)
                //                        Text("flashlight".uppercased())
                //                            .foregroundColor(Color.TextColorPrimary)
                //                            .font(.title3)
                //                    }
                //                }
                //                .toggleStyle(SwitchToggleStyle())
                
                HStack {
                    Image("buy premium")
                        .foregroundColor(Color.ColorPrimary)
                    Text("buy premium".uppercased())
                        .foregroundColor(Color.TextColorPrimary)
                        .font(.title3)
                    Spacer()
                }.onTapGesture {
                    self.viewlaunch.currentPage = "PaywallView"
                }

                
                Link(destination: URL(string: "https://ajar-utensil-e35.notion.site/Privacy-policy-1-3cb5d68948e94693a707852ccc80d15b")!) {
                    
                    HStack {
                        Image("privacy policy")
                            .foregroundColor(Color.ColorPrimary)
                        Text("privacy policy".uppercased())
                            .foregroundColor(Color.TextColorPrimary)
                            .font(.title3)
                        Spacer()
                    }
                    
                }
                
                Link(destination: URL(string: "https://ajar-utensil-e35.notion.site/Terms-of-Use-EULA-1-7209b9079593428285eb4c8927883628")!) {
                    
                    HStack {
                        Image("terms of use")
                            .foregroundColor(Color.ColorPrimary)
                        Text("terms of use".uppercased())
                            .foregroundColor(Color.TextColorPrimary)
                            .font(.title3)
                        Spacer()
                    }
                }
                
                HStack {
                    Image("rate app")
                        .foregroundColor(Color.ColorPrimary)
                    Text("rate the app".uppercased())
                        .foregroundColor(Color.TextColorPrimary)
                        .font(.title3)
                    Spacer()
                }.onTapGesture {
                    if let windowScene = UIApplication.shared.windows.first?.windowScene { SKStoreReviewController.requestReview(in: windowScene) }
                    
                }
                
                Spacer()
                
            }
            .padding(36)
            .frame(minWidth: 0, maxWidth: .infinity)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("Settings".uppercased())
                        .foregroundColor(Color.TextColorPrimary)
                        .font(.subheadline)
                }
                
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
