import SwiftUI
import ApphudSDK

struct LaunchView: View {
    @EnvironmentObject var viewlaunch: ViewLaunch
    
    @State var showSideMenu = false
    @State private var stateManager: StateManager = StateManager(showPaywall: false)
    @State var showError = false
    
    //@Binding var showPaywall : Bool
    
    @StateObject var manager = PDFDataManager()
    
    // temp false
    @State var isRequestInProgressForPro: Bool = true
    // temp false
    @State var isRequestInProgressOfferings: Bool = true
    
    var body: some View {
        VStack {
            
            if viewlaunch.currentPage == "ContentView" {
                MainUIView()
                    .environmentObject(manager)
            }
            
            if viewlaunch.currentPage == "OnboardingView1" {
                OnboardingView1()
            }
            
            if viewlaunch.currentPage == "OnboardingView2" {
                OnboardingView2()
            }
            
            if viewlaunch.currentPage == "OnboardingView3" {
                OnboardingView3()
            }
            
            if viewlaunch.currentPage == "PaywallView" {
                if (isRequestInProgressForPro || isRequestInProgressOfferings) {
                    FullProgressView()
                } else {
                    PaywallOnboardingView()
                        .environmentObject(manager)
                        .environmentObject(stateManager)
                }
            }
        }.onAppear(perform: getProducts)
    }
    
    func getProducts() {
        
        manager.isPremiumUser = Apphud.hasActiveSubscription()
//        manager.isPremiumUser = true
        isRequestInProgressForPro = false
        
        if (manager.isPremiumUser) {
            self.viewlaunch.currentPage = "ContentView"
        }
        
        var paywall: ApphudPaywall?
        
        Apphud.paywallsDidLoadCallback { (paywalls) in
            // retrieve current paywall with identifier
            paywall = paywalls.first
            
            // retrieve the products [ApphudProduct] from current paywall
            AppManager.shared.products = paywall?.products
            
            AppManager.shared.paywall = paywall
            
            isRequestInProgressOfferings = false
            
        }
        
//        isRequestInProgressOfferings = false // remove after test
    }
}

class ViewLaunch: ObservableObject {
    
    @Published var currentPage: String
    
    init() {
        //lkme
        if !UserDefaults.standard.bool(forKey: Constants.ONBOARDING_SHOW) {
//        if (true) { //TODO to test
            currentPage = "OnboardingView1"
        } else {
            currentPage = "PaywallView"
        }
    }
    
}
