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
    
    var body: some View {
        
        VStack{
            VStack(alignment: .center, spacing: 20) {
                //MARK: HEADER
                HStack {
                    
                    Text("Категория")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                    Spacer()
                    
                    Button(action: coordinator.back) {
                        Image(systemName: "xmark.circle")
                        .resizable()
                        .frame(width: 20, height: 20)
                    }
                }//:HSTACK
                .foregroundColor(.white)
                
            }//:VSTACK
            .padding()
            .background(AppColors.mainColor)
            
            TextField("", text: $text, prompt: Text("Введите категорию"))
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
    }
}
