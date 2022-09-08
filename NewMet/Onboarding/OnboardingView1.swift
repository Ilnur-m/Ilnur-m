
import Combine
import SwiftUI

struct OnboardingView1: View {
    
    @EnvironmentObject var viewlaunch: ViewLaunch
    
    var body: some View {
        ZStack {
            Image("background_1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Spacer()
                VStack(spacing: 20.0) {
                    Text("Test your skills".uppercased())
                        .font(.system(size: 19.0))
                        .fontWeight(.regular)
                        .foregroundColor(Color.TextColorPrimary)
                    
                    Text("Our metronome can help you improve your skills. Try it and see for yourself")
                        .font(.system(size: 13.0))
                        .foregroundColor(Color.TextColorSecondary)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 0, leading: 32.0, bottom: 0, trailing: 32.0))
                    
                    
                    Button(action: {
                        self.viewlaunch.currentPage = "OnboardingView2"
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
                    .padding([.bottom], 48)
                }
            }
            .padding(EdgeInsets(top: 60.0, leading: 0, bottom: 0, trailing: 0))
            .foregroundColor(Color.BackgroundColor)
            //            .navigationBarHidden(true)
            //            .navigationBarTitle("")
        }
        
    }
}

struct OnboardingView1_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView1()
    }
}
