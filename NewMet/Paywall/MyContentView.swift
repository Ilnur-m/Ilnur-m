import SwiftUI
import ApphudSDK

struct MyContentView: View {
    
    @StateObject var stateManager = StateManager(showPaywall: false)
    
    // temp false
    @State var isRequestInProgressForPro: Bool = true
    // temp false
    @State var isRequestInProgressOfferings: Bool = true
    
    @EnvironmentObject var manager: PDFDataManager
    
    var body: some View {
        VStack {
            if isRequestInProgressForPro || isRequestInProgressOfferings
            {
                FullProgressView()
            } else {
                HomeView().environmentObject(stateManager)
                //PaywallView()
            }
        }.onAppear(perform: onStart)
    }
    
    func getProducts() {
        
        manager.isPremiumUser =  Apphud.hasActiveSubscription()
        isRequestInProgressForPro = false;
        
        
        
        var paywall: ApphudPaywall?
        
        Apphud.paywallsDidLoadCallback { (paywalls) in
            // retrieve current paywall with identifier
            paywall = paywalls.first
            
            // retrieve the products [ApphudProduct] from current paywall
            AppManager.shared.products = paywall?.products
            
            AppManager.shared.paywall = paywall
            
            let keyVal = AppManager.shared.paywall?.json
            
            do {
                let trans = keyVal!["close"] as! Double
                AppManager.shared.transparent = trans
                
            } catch let error as NSError {
                print("Failed to trans : ", error)
            }
            
            
            do {
                let sub = keyVal!["sub"] as! String
                AppManager.shared.sub = sub
                
            } catch let error as NSError {
                print("Failed to trans :", error)
            }
            
            isRequestInProgressOfferings = false
            
        }
    }
    
    private func onStart() {
        getProducts()
    }
    
//    func flag(from country:String) -> String {
//        let base : UInt32 = 127397
//        var s = ""
//        for v in country.uppercased().unicodeScalars {
//            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
//        }
//        return s
//    }
}

extension UIScreen {
    static let screenWidth   = UIScreen.main.bounds.size.width
    static let screenHeight  = UIScreen.main.bounds.size.height
    static let screenSize    = UIScreen.main.bounds.size
}

struct MyContentView_Preview: View {
    @StateObject private var manager = PDFDataManager()
    var body: some View {
        MyContentView().environmentObject(manager)
    }
}

struct MyContentView_Previews: PreviewProvider {

    static var previews: some View {
        MyContentView_Preview()
    }
}

