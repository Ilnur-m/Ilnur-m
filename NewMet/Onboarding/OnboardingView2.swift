import SwiftUI
import StoreKit

struct OnboardingView2: View {
    
    @EnvironmentObject var viewlaunch: ViewLaunch
    let heightRatio:CGFloat = 0.8
    
    var body: some View {
        ZStack{
            Image("background_2")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .center) {
                GeometryReader { geo in
                    HStack {
                        Spacer()
                        Image("background_2_2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width*heightRatio, height: geo.size.height,
                                               alignment: .center)
                        Spacer()
                    }
                    
                }

                Spacer()
                VStack(spacing: 20.0) {
                    Text("Help us GET better".uppercased())
                        .font(.system(size: 19.0))
                        .fontWeight(.regular)
                        .foregroundColor(Color.TextColorPrimary)
                    Text("We are constantly monitoring reviews in order to make our app better")
                        .font(.system(size: 13.0))
                        .foregroundColor(Color.TextColorSecondary)
                        .multilineTextAlignment(.center)
                        .padding(EdgeInsets(top: 0, leading: 32.0, bottom: 0, trailing: 32.0))
                    
                    Button(action: {
                        self.viewlaunch.currentPage = "OnboardingView3"
                        if let windowScene = UIApplication.shared.windows.first?.windowScene { SKStoreReviewController.requestReview(in: windowScene) }

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
//
//            .navigationBarHidden(true)
//            .navigationBarTitle("")
        }
    }
}

struct OnboardingView2_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView2()
    }
}
