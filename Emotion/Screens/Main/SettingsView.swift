//
//  SettingsView.swift
//  Emotion
//
//  Created by User on 19.11.2021.
//

import SwiftUI

struct SettingsView: View {
    
    @EnvironmentObject var coordinator: EmotionCoordinator
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: coordinator.back) {
            Text("Hello, Settings!")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
