//
//  AddTaskViewModel.swift
//  Emotion
//
//  Created by Владислав Бороздин on 22.12.2021.
//

import Combine
import SwiftUI

class AddTaskViewModel: ObservableObject {
    
    @Published var currentEmotion: Emotion.Smile = .normal
    
    func set(emotion: Emotion.Smile) {
        currentEmotion = emotion
    }
    
}
