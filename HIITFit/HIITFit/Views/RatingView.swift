import SwiftUI
import CoreMedia

struct RatingView: View {
    var body: some View {
        HStack {
            ForEach(0 ..< 5) { _ in
                Image(systemName: "waveform.path.ecg").foregroundColor(.gray).font(.largeTitle).background(RoundedRectangle(cornerRadius: 90).fill(Color.red))
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView().previewLayout(.sizeThatFits)
    }
}
