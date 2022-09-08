//
//  ContentView.swift
//  swiftuiPaywall
//
//  Created by lk on 12.04.2022.
//

import SwiftUI
import ApphudSDK
//import RevenueCat

class Offerings {
    var current: Offering?
    
    init() {
        
    }
}

class Offering {
    var availablePackages: [Package] = []
}

enum PackageType {
    case annual
    case month
}

class Package {
    var packageType: PackageType?
    var localizedPriceString: String = ""
    
    init() {
        
    }
}

struct PaywallApphud: View {
    
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
            Color(.white).ignoresSafeArea()
            
            // Popup restore purchases
            if (isShowRestorePopup) {
                
                    ZStack {
                           Color.black
                           VStack {
                               Text("Restore purchaces").foregroundColor(Color.ColorPrimary)
                               Spacer()
                                       .frame(height: 16)
                               if isRestored == true {
                                   Text("We restored your subscrption you are pro now").foregroundColor(Color.ColorPrimary)
                                   //VPNManager.shared.isPro = true
                               }

                               if isRestored == false {
                                   Text("Sorry we are unable to find any active subscriptio in your account").foregroundColor(Color.ColorPrimary)
                               }
                               Spacer()
                                       .frame(height: 16)
                               Button(action: {
                                   isShowRestorePopup = false
                                   stateManager.showPaywall = false;
                                   //self.showPopUp = false
                               }, label: {
                                   Text("Close").foregroundColor(Color.ColorPrimary)
                               })
                           }.padding()
                    }.onAppear(perform: {
                        isPurchasing = false
                    })
                       .frame(width: 300, height: 200)
                       .cornerRadius(20).shadow(radius: 20)
                }
             

          
            //Title
                HStack(alignment: VerticalAlignment.top) {
                    ZStack {
                        if isPurchasing {
                            ProgressView().progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                        }
                VStack (){
                    
                    
                    HStack() {
                        //VStack (){
                        // Top Part
                        //Close
                        
                        Button(action:{
                            UIImpactFeedbackGenerator().impactOccurred()
//                            isPresented = false;
                            stateManager.showPaywall = false;
                        }, label: {
                            ZStack() {
                                Circle()
                                    .fill(Color(white: AppManager.shared.transparent))//.opacity(1.0)
                                    //.opacity(AppManager.shared.transparent)
                                    .frame(width: 30, height: 30, alignment: Alignment.top)
                                //.frame(diameter: 30)
                                
                                Image(systemName: "xmark")
                                    .font(.system(size: 15, weight: .bold, design: .rounded))
                                    .foregroundColor(.white)
                            }
                            .padding(8)
                            .contentShape(Circle())
                        })
                            .frame(width: 30, height: 30, alignment: .topTrailing)
                            .buttonStyle(PlainButtonStyle())
                            .accessibilityLabel(Text("Close"))
                            .padding(.leading, 24)
                        
                        Spacer()
                        //}
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    
                    VStack {
                        Text("Looks like you want to work with documents as conveniently ")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(Color(#colorLiteral(red: 0.09, green: 0.09, blue: 0.09, alpha: 1)))
                        + Text("as possible")
                            .font(.system(size: 28, weight: .semibold))
                            .foregroundColor(Color(#colorLiteral(red: 0.2, green: 0.47, blue: 0.97, alpha: 1)))
                    }
                    .frame(minWidth: 0, maxWidth: .infinity,  alignment: .leading)
                    .padding(.leading, 16)
                    .frame(height: 110)
                    .padding(.trailing, 16)
                    .padding(.top, 16)
                    
                    VStack {
                        Spacer()
                            .frame(height: 8)
                        //Text
                        Text("Get full access to all features 🔥").font(.system(size: 17, weight: .regular)).foregroundColor(Color(#colorLiteral(red: 0.6, green: 0.61, blue: 0.66, alpha: 1))).tracking(-0.41).multilineTextAlignment(.center)
                        Spacer()
                            .frame(height: 20)
                    }
                    
                    VStack (){
                        PWCellView(strImageName: "AppIcon", strTitle: "Unlimited number of documents", strDescription: "The free version has a limit on the number of documents")
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                        Spacer()
                            .frame(height: 20)
                        PWCellView(strImageName: "AppIcon", strTitle: "Text recognition (OCR)", strDescription: "Convert your scans to text so you can read, copy and export it")
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                        Spacer()
                            .frame(height: 20)
                        PWCellView(strImageName: "AppIcon", strTitle: "Remove Ads", strDescription: "Get rid of all banners and videos when you open the app")
                            .padding(.leading, 16)
                            .padding(.trailing, 16)
                        
                        Spacer()
                            .frame(height: 16)
                        
                    }
                    
                    Spacer().frame(maxHeight: .infinity)
                    
//                    let product1:ApphudProduct = AppManager.shared.products![0]
//                    let name = product1.name
//                    let currency = product1.skProduct?.priceLocale.currencySymbol
//                    let price = (product1.skProduct?.price.stringValue)! + " " + currency!
//
                    
                    
                    Text("price"+" per " + "name!")
                        .foregroundColor(.black)
                    //(Color(white: AppManager.shared.transparent))
                        .fontWeight(.light)
                        .font(.body)
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity)
                        .lineSpacing(22)
                        .padding(16)
                    
                    VStack {
                        Text(AppManager.shared.sub)
                            .foregroundColor(.white)
                            .fontWeight(.medium)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .frame(maxWidth: .infinity)
                            .lineSpacing(22)
                        
                            .padding(.top, 13)
                            .padding(.bottom, 14)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color(red: 0.20, green: 0.47, blue: 0.97))
                            .cornerRadius(8)
                            .frame(maxWidth: .infinity)
                            .frame(height: 16)
                            .padding(.horizontal, 18)
                        
                        Spacer()
                            .frame(height: 20)
                        
                        Spacer()
                            .frame(height: 8)
                    }.onTapGesture {
                        UIImpactFeedbackGenerator().impactOccurred()
                        tryYear()
                    }
                    
                    ZStack(alignment: .bottom) {
                        
                        GeometryReader { geometry in
                            
                            // Restore, Privacy, Therms
                            VStack {
                                HStack() {
                                    
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
                                        
                                    }.foregroundColor(Color.black)
                                    
                                    Text("•").foregroundColor(Color.black)
                                    
                                    Link(destination: URL(string: "https://ajar-utensil-e35.notion.site/Privacy-policy-70ea3069f4f8498fa5ea38c912c3522e")!) {
                                        Text("Privacy").foregroundColor(Color.black)
                                    }.padding(8)
                                    
                                    Text("•").foregroundColor(Color.black)
                                    
                                    Link(destination: URL(string: "https://ajar-utensil-e35.notion.site/Terms-of-Use-EULA-4e14a853a6304a6eb0a8713b020be276")!) {
                                        Text("Terms").foregroundColor(Color.black)
                                    }.padding(8)
                                }.frame(minWidth: 0, maxWidth: .infinity, maxHeight: .infinity)
                            }
                        }
                        //.frame(height: 20)
                        
                    }
                }
            }.background(Color.white)
                }
        
        }
    }
    
    func tryYear() {
        //let package2 = offering?.availablePackages[0];
        isPurchasing = true
        
        let product1:ApphudProduct = AppManager.shared.products![0]

        Apphud.purchase(product1) { result in
            isPurchasing = false
           if let subscription = result.subscription, subscription.isActive(){
               manager.isPremiumUser = true
               manager.showPaywall = false
               // has active subscription
           } else if let purchase = result.nonRenewingPurchase, purchase.isActive(){
              // has active non-renewing purchase
           } else {
              // handle error or check transaction status.
           }
        }

    }
}

struct PaywallApphud_Preview: View {
    
    var body: some View {
        PaywallApphud()
    }
    
}


struct PaywallApphud_Previews: PreviewProvider {
    
    static var previews: some View {
        PaywallApphud_Preview()
    }
}
