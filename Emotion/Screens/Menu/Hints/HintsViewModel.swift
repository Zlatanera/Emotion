//
//  HintsViewModel.swift
//  Emotion
//
//  Created by Владислав Бороздин on 29.11.2022.
//

import Foundation
import SwiftUI
import UserNotifications

class HintsViewModel: ObservableObject {
    
    @Published var enoughTaskCount: Bool = false
    
    func updateCountEmotion(notes: [Notes]) {
        enoughTaskCount = notes.filter({ $0.emotion == Emotion.Smile.happy.id }).count > 2
        
        notification2(count: notes.count)
        
        if enoughTaskCount {
            notification1()
        }
    }
    
    func notification1() {
        let content = UNMutableNotificationContent()
        content.title = "Congratulations!"
        content.subtitle = "Ты на правильном пути!"
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
    func notification2(count: Int) {
        let content = UNMutableNotificationContent()
        content.title = "Congratulations!"
        content.subtitle = "Ты набрал \(count)!"
        content.sound = UNNotificationSound.default

        // show this notification five seconds from now
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)

        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
    }
    
}
