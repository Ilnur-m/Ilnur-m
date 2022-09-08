import SwiftUI

@main
struct NewMetApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

    @StateObject var viewLauncher: ViewLaunch = ViewLaunch()
    
    var body: some Scene {
        WindowGroup {
            LaunchView().environmentObject(viewLauncher)
        }
    }
}
