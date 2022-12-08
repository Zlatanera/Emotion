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
    
    func updateTaskCount(taskCount: Int) {
        enoughTaskCount = taskCount > 9
        
        if enoughTaskCount {
            notification()
        }
    }
    
    func notification() {
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
    
}
