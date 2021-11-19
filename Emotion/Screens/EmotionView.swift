
import SwiftUI

struct EmotionView: View {
    
    @EnvironmentObject var coordinator: EmotionCoordinator
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if #available(iOS 14.0, *) {
            coordinator.currentScene
                .ignoresSafeArea(.all, edges: .top)
        } else {
            coordinator.currentScene
                .edgesIgnoringSafeArea(.top)
        }
    }
    
}

struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView()
    }
}
