//
//  SettingsView.swift
//  Emotion
//
//  Created by Владислав Бороздин on 06.12.2022.
//

import SwiftUI

struct CategoriesView: View {
    
    @EnvironmentObject var coordinator: EmotionCoordinator
    @ObservedObject var viewModel = CategoriesViewModel()
    
    @State private var text: String = ""
    
    let items: [Categories]
    
    var body: some View {
        
        VStack{
            TextField("", text: $text)
                .onSubmit {
                    coordinator.addCategory(text)
                }
                .frame(width: 150, height: 50)
            ScrollView(.vertical) {
                    
                VStack {
                    
                    ForEach(coordinator.categories, id: \.self) { category in
                        Text(category.title ?? "None")
                    }
                }
            }
        }
        .onAppear {
            viewModel.load(items)
        }
    }
}
