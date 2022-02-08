import SwiftUI
import AVKit

struct ExerciseView: View {
    @State private var showAlert = false
    let interval: TimeInterval = 30
    let videoNames = ["squat", "step-up", "burpee", "sun-salute"]
    let exerciseNames = ["Squat", "Step Up", "Burpee", "Sun Salute"]
    let index: Int
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HeaderView(exerciseName: exerciseNames[index]).padding(.bottom)
                    
                if let url = Bundle.main.url(forResource: videoNames[index], withExtension: "mp4") {
                    VideoPlayer(player: AVPlayer(url:url)).frame(height: geometry.size.height*0.45)
                } else {
                    Text("Couldn't find \(videoNames[index]).mp4").foregroundColor(.red)
                }
                Text(Date().addingTimeInterval(interval), style: .timer).font(.system(size: 90)).foregroundColor(.white).frame(width: 300, height: 100, alignment: .center).background(RoundedRectangle(cornerRadius: 20))
                Button("Start/Done"){ } .font(.title3).padding()
                RatingView().padding()
                Spacer()
                Button("History") {showAlert=true} .alert(isPresented: $showAlert) { Alert(title:Text("No history to show"))}
                
            }
        }
        
        
    }
}
struct ExerciseView_Previews: PreviewProvider {
    static var previews: some View {
        ForEach(0..<4) {index in ExerciseView(index: index)}
    }
}


