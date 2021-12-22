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
        let task: String
        let timestamp = Date.now
    }
}
