//
//  AppImages.swift
//  Emotion
//
//  Created by Владислав Бороздин on 12.10.2022.
//

import SwiftUI

class AppImages {
    
    static func instruction1() -> some View {
        Image("Instraction1")
            .resizable()
            .scaledToFit()
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
    } 
    
}
