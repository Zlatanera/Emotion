//
//  OnBoardingModel.swift
//  Emotion
//
//  Created by Владислав Бороздин on 16.12.2021.
//

import SwiftUI

//MARK: EMOTION DATA MODEL

struct OnBoardingCard: Identifiable {
    var id = UUID()
    var image: String
    var description: String
}
