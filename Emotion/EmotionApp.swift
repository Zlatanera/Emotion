//
//  EmotionApp.swift
//  Emotion
//
//  Created by User on 19.11.2021.
//

import SwiftUI

@main
struct EmotionApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            EmotionView()
                .environmentObject(EmotionCoordinator(navigator: NavigationControllerSwiftUI()))
        }
    }
}
