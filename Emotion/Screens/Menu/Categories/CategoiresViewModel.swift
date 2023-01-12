//
//  SettingViewModel.swift
//  Emotion
//
//  Created by Владислав Бороздин on 06.12.2022.
//

import SwiftUI

class CategoriesViewModel: ObservableObject {
 
    @Published var categories: [String] = []
    
    func load(_ items: [Categories]) {
        
        categories = items.map({ $0.title! })
        
    }
    

    
}
