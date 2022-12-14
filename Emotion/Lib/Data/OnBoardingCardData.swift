//
//  OnBoardingCardData.swift
//  Emotion
//
//  Created by Владислав Бороздин on 16.12.2021.
//

import SwiftUI

//MARK: EMOTION DATA

let onBoardingCardData: [OnBoardingCard] = [
    OnBoardingCard(
        image: AnyView(AppImages.instruction1()),
        description: "Emotionly - ваш личный помощник, с которым можно поделиться не только делами на день, но и своим настроением"
      ),
    OnBoardingCard(
        image: AnyView(AppImages.instruction2()),  
        description: "Записывайте задачи, дополняйте их настроением и отслеживайте статистику вашего состояния за неделю, месяц и год"
      ),
    OnBoardingCard(
        image:  AnyView(AppImages.instruction3()),
        description: "Сохраните всё важное в одном месте, чтобы ничего не упустить. Ну что, начнем?"
      )
]
