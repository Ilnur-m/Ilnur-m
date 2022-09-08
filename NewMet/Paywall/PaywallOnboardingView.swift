//
//  PaywallOnboardingView.swift
//  NewMet
//
//  Created by Артем Галушкин on 08.09.2022.
//

import SwiftUI
import ApphudSDK

struct PaywallOnboardingView: View {
    
    @EnvironmentObject var viewlaunch: ViewLaunch
    
    @EnvironmentObject var manager: PDFDataManager
    @State private var animationAmount = 1.0
    //    @Binding var isPresented: Bool
    @EnvironmentObject private var stateManager: StateManager
    @State var isPurchasing: Bool = false
    @State var isShowRestorePopup: Bool = false
    @State var isRestored: Bool = false
    var offering: Offering? = AppManager.shared.offeringList?.current
    
    var body: some View {
        ZStack {
            Image("paywall_background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            VStack{
                
                HStack(alignment: .center) {
                    Spacer()
                    Button(action:{
                        UIImpactFeedbackGenerator().impactOccurred()
    //                            isPresented = false; //для чего??
//                        stateManager.showPaywall = false;
                        self.viewlaunch.currentPage = "ContentView"
                    }, label: {
                        ZStack() {
                            Circle()
                                .fill(Color.BackgroundColor)
                                .frame(width: 30, height: 30, alignment: Alignment.top)
                            
                            Image(systemName: "xmark")
                                .font(.system(size: 15, weight: .bold, design: .rounded))
                                .foregroundColor(Color.TextColorPrimary)
                        }
                        .padding(8)
                        .contentShape(Circle())
                    })
                    .frame(width: 56, height: 56, alignment: .center)
                        .buttonStyle(PlainButtonStyle())
                        .accessibilityLabel(Text("Close"))
                }.frame(minWidth: 0, maxWidth: .infinity)
                
                Spacer()
                
                let product1:ApphudProduct? = AppManager.shared.products?.first
                let name = product1?.name ?? "week"
                let currency: String? = product1?.skProduct?.priceLocale.currencySymbol ?? "$"
                let price = (product1?.skProduct?.price.stringValue ?? "4,99")! + " " + currency!
                
                VStack(spacing: 20.0) {
                    Text("Start right now".uppercased())
                        .font(.system(size: 19.0))
                        .fontWeight(.regular)
                        .foregroundColor(Color.TextColorPrimary)
                    
                    Text("Subscribe to unlock all the features,\njust for \(price)/\(name)")
                        .font(.system(size: 13.0))
                        .foregroundColor(Color.TextColorSecondary)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 0, leading: 32.0, bottom: 0, trailing: 32.0))
                    
                    
                    Button(action: {
                        UIImpactFeedbackGenerator().impactOccurred()
                        tryYear()
                    }) {
                        Text("CONTINUE")
                            .fontWeight(.regular)
                            .font(.system(size: 15.0))
                            .foregroundColor(Color.TextColorPrimary)
                            .frame(minWidth: 0, maxWidth: 314, minHeight: 64 )
                            .overlay(
                                RoundedRectangle(cornerRadius: 16)
                                    .stroke(Color.ColorPrimary, lineWidth: 2)
                            )
                    }
                    .padding([.bottom], 24)
                    
                    HStack {
                        Spacer()
                        
                        Link(
                            destination: URL(
                                string: "https://ajar-utensil-e35.notion.site/Terms-of-Use-EULA-1-7209b9079593428285eb4c8927883628"
                            )!
                        ) {
                            Text("Terms of Use")
                                .font(.system(size: 11.0))
                                .foregroundColor(Color.TextColorSecondary)
                        }
                        .padding(8)
                        .frame(height: 48, alignment: .center)
                        
                        Spacer()
                        
                        Button("Restore") {
                            isPurchasing = true
                            
                            Apphud.restorePurchases{ subscriptions, purchases, error in
                                isPurchasing = false
                                if Apphud.hasActiveSubscription(){
                                    // has active subscription
                                    manager.isPremiumUser = true;
                                    
                                    presentAlert(title: "Restore purchase", message: "Congrats you are Pro !", primaryAction: UIAlertAction(title: "OK", style: .cancel, handler: nil), secondaryAction: nil)
                                    //
                                    //
                                    //                                                    return
                                } else {
                                    
                                    presentAlert(title: "Restore purchase", message: "Sorry we are unable to restore your purchase", primaryAction: UIAlertAction(title: "OK", style: .cancel, handler: nil), secondaryAction: nil)
                                    //
                                    //
                                    //                                                }
                                    // no active subscription found, check non-renewing purchases or error
                                }
                            }
                            
                        }
                        .font(.system(size: 11.0))
                        .foregroundColor(Color.TextColorSecondary)
                        .frame(height: 48, alignment: .center)
                        .frame(minWidth: 70, maxWidth: 150)
                        
                        Spacer()
                        
                        Link(
                            destination: URL(
                                string: "https://ajar-utensil-e35.notion.site/Privacy-policy-1-3cb5d68948e94693a707852ccc80d15b"
                            )!
                        ) {
                            Text("Privacy Policy")
                                .font(.system(size: 11.0))
                                .foregroundColor(Color.TextColorSecondary)
                        }
                        .padding(8)
                        .frame(height: 48, alignment: .center)
                        
                        Spacer()
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding([.bottom], 48)
                    
                    
                }
            }
            .padding(EdgeInsets(top: 44, leading: 0, bottom: 0, trailing: 0))
            .foregroundColor(Color.BackgroundColor)
            //            .navigationBarHidden(true)
            //            .navigationBarTitle("")
        }
        
    }
    
    func tryYear() {
        //let package2 = offering?.availablePackages[0];
        isPurchasing = true
        
        ///TEST
//        self.viewlaunch.currentPage = "ContentView"
//        return
        ///--------------
        
        let product1: ApphudProduct? = AppManager.shared.products?.first ?? nil

        if (product1 != nil) {
        Apphud.purchase(product1!) { result in
            isPurchasing = false
           if let subscription = result.subscription, subscription.isActive(){
               manager.isPremiumUser = true
//               manager.showPaywall = false
               self.viewlaunch.currentPage = "ContentView"

               // has active subscription
           } else if let purchase = result.nonRenewingPurchase, purchase.isActive(){
              // has active non-renewing purchase
           } else {
              // handle error or check transaction status.
           }
        }
        }
    }
    
}

struct PaywallOnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        PaywallOnboardingView()
    }
}
