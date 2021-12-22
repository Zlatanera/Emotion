
import SwiftUI

struct EmotionView: View {
    
    @EnvironmentObject var coordinator: EmotionCoordinator
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        if #available(iOS 14.0, *) {
            coordinator.currentScene
                .ignoresSafeArea(.all, edges: .bottom)
        } else {
            coordinator.currentScene
                .edgesIgnoringSafeArea(.bottom)
        }
    }
    
}

struct EmotionView_Previews: PreviewProvider {
    static var previews: some View {
        EmotionView()
    }
}
