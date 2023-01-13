//
//  AddTaskModel.swift
//  Emotion
//
//  Created by Владислав Бороздин on 22.12.2021.
//

import Foundation

enum AddTask {
    struct forDB {
        let emotion: Emotion.Smile
        let description: String
        let timestamp = Date.now
        let category: Categories?
    }
}
