//
//  UserDefaults+ext.swift
//  Emotion
//
//  Created by Владислав Бороздин on 12.10.2022.
//

import Foundation

//перенести из предыдущих проектов userdefaults, один ключ bool будет для onboarding

class UserDefaultsExt: UserDefaults {
    

    static let shared = UserDefaultsExt()
    
    let defaults = UserDefaults.standard
    
    
//    class UserDefaultsManager: UserDefaults {
//
//        enum UserDefaultsKeys: String {
//            case phone
//            case password
//            case firstName
//            case lastName
//            case dob
//        }
//
//        static let shared = UserDefaultsManager()
//
//        let defaults = UserDefaults.standard
//
//        var userPhone: String? {
//            get {
//                return defaults.string(forKey: UserDefaultsKeys.phone.rawValue)
//            }
//            set (newValue) {
//                defaults.set(newValue, forKey: UserDefaultsKeys.phone.rawValue)
//            }
//        }
//
//        var userPassword: String? {
//            get {
//                return defaults.string(forKey: UserDefaultsKeys.password.rawValue)
//            }
//            set (newValue) {
//                defaults.set(newValue, forKey: UserDefaultsKeys.password.rawValue)
//            }
//        }
//
//        var userFirstName: String? {
//            get {
//                return defaults.string(forKey: UserDefaultsKeys.firstName.rawValue)
//            }
//            set (newValue) {
//                defaults.set(newValue, forKey: UserDefaultsKeys.firstName.rawValue)
//            }
//        }
//
//        var userLastName: String? {
//            get {
//                return defaults.string(forKey: UserDefaultsKeys.lastName.rawValue)
//            }
//            set (newValue) {
//                defaults.set(newValue, forKey: UserDefaultsKeys.lastName.rawValue)
//            }
//        }
//
//        var userDOB: String? {
//            get {
//                return defaults.string(forKey: UserDefaultsKeys.dob.rawValue)
//            }
//            set (newValue) {
//                defaults.set(newValue, forKey: UserDefaultsKeys.dob.rawValue)
//            }
//        }
//    }
    
}
