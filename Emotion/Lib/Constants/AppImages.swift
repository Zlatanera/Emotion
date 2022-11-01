//
//  AppImages.swift
//  Emotion
//
//  Created by Владислав Бороздин on 12.10.2022.
//

import SwiftUI

class AppImages {
    
    //Onboarding Card
    static func instruction1() -> some View {
        Image("Instraction1")
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
    }
    
    static func instruction2() -> some View {
        Image("Instraction2")
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
    }
    
    static func instruction3() -> some View {
        Image("Instraction3")
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
    }
    
    //Image for button
    static func addTask() -> some View {
        Image("AddTask")
            .resizable()
            .frame(width: 20, height: 20)
            //.background(Circle().fill(AppColors.mainColor))
    }
    
    static func addTaskImage() -> some View {
        Image("AddTaskImage") //"AddTaskImage"
            .resizable()
            .scaledToFit()
            .background(Circle().fill(AppColors.mainColor))
    }
    
    //Emotion Image
    static func emotionImageVerySad() -> some View {
        Image("verySad")
            .resizable()
            .scaledToFit()
    }
    
    static func emotionImageSad() -> some View {
        Image("Sad")
            .resizable()
            .scaledToFit()
    }
    
    static func emotionImageNormal() -> some View {
        Image("normal")
            .resizable()
            .scaledToFit()
    }
    
    static func emotionImageHappy() -> some View {
        Image("happy")
            .resizable()
            .scaledToFit()
    }
    
    static func emotionImageVeryHappy() -> some View {
        Image("veryHappy")
            .resizable()
            .scaledToFit()
    }
    
    //Start Screen Image
    
    static func startImage() -> some View {
        Image("startScreen")
            .resizable()
            .scaledToFit()
    }
    
    //Menu button
    
    static func notificationImage() -> some View {
        Image("notification")
            .resizable()
            .scaledToFit()
    }
    
    static func ReviewImage() -> some View {
        Image("Review")
            .resizable()
            .scaledToFit()
    }
    
    static func StyleImage() -> some View {
        Image("Style")
            .resizable()
            .scaledToFit()
    }
    
    static func SupportImage() -> some View {
        Image("Support")
            .resizable()
            .scaledToFit()
    }
    
    static func MenuImage() -> some View {
        Image("Menu")
            .resizable()
            .scaledToFit()
    }
    
}
