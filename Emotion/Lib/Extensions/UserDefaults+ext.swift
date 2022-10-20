//
//  UserDefaults+ext.swift
//  Emotion
//
//  Created by Владислав Бороздин on 12.10.2022.
//

import Foundation

//перенести из предыдущих проектов userdefaults, один ключ bool будет для onboarding

extension UserDefaults {
    
        enum UserDefaultsKeys: String {
            case onboardingPassed
        }

        static var onboardingPassed: Bool {
            get {
                return standard.bool(forKey: UserDefaultsKeys.onboardingPassed.rawValue)
            }
            set (newValue) {
                standard.set(newValue, forKey: UserDefaultsKeys.onboardingPassed.rawValue)
            }
        }

    
}
