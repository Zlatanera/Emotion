//
//  ChangeTaskModel.swift
//  Emotion
//
//  Created by Владислав Бороздин on 08.11.2022.
//

import Foundation

enum ChangeTask {
    struct forDB {
        let emotion: Emotion.Smile
        let task: String
        let timestamp = Date.now
    }
}
