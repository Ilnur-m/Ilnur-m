
import SwiftUI

struct MatchedNoteFrequency: View {
    let frequency: Frequency
    var body: some View {
        Text(frequency.localizedString())
            .font(.system(.title2, design: .monospaced))
            .font(.system(size: 20))
            .foregroundColor(Color.TextColorPrimary)
//        Text(frequency.localizedString())
            //.font(.system(.title3, design: .serif))
//            .font(Font.custom("Petahja-Regular", size: 24))
//            .foregroundColor(Color("mainColor1"))
    }
}

struct MatchedNoteFrequency_Previews: PreviewProvider {
    static var previews: some View {
        MatchedNoteFrequency(frequency: 440.0)
            .previewLayout(.sizeThatFits)
    }
}
