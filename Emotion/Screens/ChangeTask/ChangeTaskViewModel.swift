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
    @Published var category: Categories?
    
    func setup(notes: Notes) {
        currentEmotion = Emotion.Smile.getEmotionFor(id: notes.emotion)
        category = notes.category
    }
    
    func set(emotion: Emotion.Smile) {
        currentEmotion = emotion
    }
    
}
