//
//  MainView.swift
//  Emotion
//
//  Created by User on 19.11.2021.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var coordinator: EmotionCoordinator
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        Button(action: coordinator.showSettings) {
            Text("Hello, Main!")
        }
    
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
