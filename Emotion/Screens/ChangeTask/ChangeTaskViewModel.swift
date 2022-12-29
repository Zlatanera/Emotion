//
//  ChangeTaskViewModel.swift
//  Emotion
//
//  Created by Владислав Бороздин on 08.11.2022.
//

import Combine
import SwiftUI

class ChangeTaskViewModel: ObservableObject {
    
    @Published var currentEmotion: Emotion.Smile = .normal
    
    func setup(notes: Notes) {
        currentEmotion = Emotion.Smile.getEmotionFor(id: notes.emotion)
    }
    
    func set(emotion: Emotion.Smile) {
        currentEmotion = emotion
    }
    
}
