
import SwiftUI


struct MainUIView: View {
    
    @Environment(\.colorScheme) private var colorScheme: ColorScheme
    @State private var isDarkModeOn = false
    
    @EnvironmentObject var manager: PDFDataManager
    
    var body: some View {
        //        ContentViewOnBoarding()
        TabView {
            PlayView().tabItem {
                Image(systemName: "metronome")
                Text("Preset")
            }
            //TunerView
            TunerView().tabItem {
                Image(systemName: "tuningfork")
                Text("Tuner")
            }
            .environmentObject(manager)
            
            SettingsView().tabItem {
                Image(systemName: "slider.vertical.3")
                Text("Settings")
            }
        }
        
    }
    
    func setAppTheme(){
        //MARK: use saved device theme from toggle
        isDarkModeOn = UserDefaultsUtils.shared.getDarkMode()
        changeDarkMode(state: isDarkModeOn)
        //MARK: or use device theme
        if (colorScheme == .dark) {
            isDarkModeOn = true
        } else {
            isDarkModeOn = false
        }
        changeDarkMode(state: isDarkModeOn)
    }
    func changeDarkMode(state: Bool){
        (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.windows.first!.overrideUserInterfaceStyle = state ? .dark : .light
        UserDefaultsUtils.shared.setDarkMode(enable: state)
    }
    
}

struct MainUIView_Previews: PreviewProvider {
    static var previews: some View {
        MainUIView()
    }
}


/*TODO:
 - Variation of sounds between accent clicks and regular ones
 - Show (6?) accent buttons, grey out ones that do not need to be there
 */

