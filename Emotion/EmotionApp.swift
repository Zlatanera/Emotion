//
//  EmotionApp.swift
//  Emotion
//
//  Created by User on 19.11.2021.
//

import SwiftUI

@main
struct EmotionApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
