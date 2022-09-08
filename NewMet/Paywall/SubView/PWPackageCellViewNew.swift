////
////  PWPackageCellViewNew.swift
////  NewMet
////
////  Created by Артем Галушкин on 07.09.2022.
////
//
//import SwiftUI
//
///* The cell view for each package */
//struct PWPackageCellViewNew: View {
//    //let package: Package
//    
//    //let labelYear = NSLocalizedString("loc.pay.year", comment: "year")
//    //let labelMonth = NSLocalizedString("loc.pay.month", comment: "month")
//    let labelPeriod: String
//    let localizedPriceString: String
//    let packageType: PackageType
//    let handler: () -> Void
//    
//    @EnvironmentObject var manager: PDFDataManager
//    
//    let onSelection: (Package) -> Void
//    var body: some View {
//        //let viewYear = PWCellPeriodLongAnnual(strPeriod: "Year", strPrice: localizedPriceString)
//        //let viewMonth = PWCellPeriodLong(strPeriod: "Month", strPrice: localizedPriceString)
//        
//        // let period = String(package.packageType == PackageType.annual ? labelYear : labelMonth)
//        //let view = package.packageType == PackageType.annual ? viewYear : viewMonth
//        HStack {
//            //Text(labelPeriod)
//            //Text(package.localizedPriceString + "/" + period)
//              //  .font(.title3)
//               // .bold().foregroundColor(.black)
//
////            if packageType == PackageType.annual {
////                viewYear
////            } else {
////                viewMonth
////            }
//            
//            PWCellPeriodLong(strPeriod: labelPeriod, strPrice: localizedPriceString)
//
//        }.contentShape(Rectangle())
//        .onTapGesture {
//            UIImpactFeedbackGenerator().impactOccurred()
//            //onSelection(package)
//            
//            let product1:ApphudProduct = AppManager.shared.products![0]
//
//            Apphud.purchase(product1) { result in
//               if let subscription = result.subscription, subscription.isActive(){
//                   manager.isPremiumUser = true
//                   manager.showPaywall = false
//                   // has active subscription
//               } else if let purchase = result.nonRenewingPurchase, purchase.isActive(){
//                  // has active non-renewing purchase
//               } else {
//                  // handle error or check transaction status.
//               }
//            }
//            
//        }.onAppear(perform:{
//            //SwiftyBeaver.debug("product: \(String(describing: package.storeProduct.productIdentifier))")
//        })
//    }
//
//}
//
//struct PWPackageCellViewNew_Previews: PreviewProvider {
//    static var previews: some View {
//        PWPackageCellViewNew()
//    }
//}
