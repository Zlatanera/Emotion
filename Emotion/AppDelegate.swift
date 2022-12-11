//
//  AppDelegate.swift
//  Emotion
//
//  Created by Владислав Бороздин on 08.12.2022.
//

import Foundation
import SwiftUI
import UserNotifications

class AppDelegate: NSObject, UIApplicationDelegate {
  
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
           
           UNUserNotificationCenter.current().delegate = self
           
           UNUserNotificationCenter.current().requestAuthorization(options: [.badge, .sound]) { success, error in
               guard error == nil else {
                   print(error!)
                   print(error!.localizedDescription)
                   return
               }
               if success {
                   print("All set!")
               } else if let error = error {
                   print(error.localizedDescription)
               }
           }
           return true
       }
   }

   extension AppDelegate: UNUserNotificationCenterDelegate {
       
       func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {

           let userInfo = response.notification.request.content.userInfo
           // Handle notification

           completionHandler()
       }
       
       func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
           completionHandler([.alert, .badge, .sound])
       }
    
    
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound, .provisional]) { success, error in
//            if success {
//                print("All set!")
//            } else if let error = error {
//                print(error.localizedDescription)
//            }
//        }
//        return true
//    }
}
