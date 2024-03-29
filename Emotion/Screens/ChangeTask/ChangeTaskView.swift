//
//  ChangeTaskView.swift
//  Emotion
//
//  Created by Владислав Бороздин on 08.11.2022.
//

import Foundation

import SwiftUI

struct ChangeTaskView: View {
    
    @EnvironmentObject var coordinator: EmotionCoordinator
    @ObservedObject var viewModel = ChangeTaskViewModel()
    @Environment(\.colorScheme) var colorScheme
    
    @State private var nameTask: String = ""
    
    let changePair: Emotion.NotesIndex
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 20) {
                //MARK: HEADER
                HStack {
                    AppImages.addTask()
                    
                    Text("Новая запись")
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
                
                //MARK: INPUT TASK
                TextField("Введите задачу", text: $nameTask)
                    .padding(20)
                    .background(AppColors.white)
                    .cornerRadius(15)
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .shadow(color: .gray, radius: 15, x: 0, y: 0)
                
            }//:VSTACK
            .padding()
            .background(AppColors.mainColor)
            
            //MARK: CHOOSE EMOTION
            Text("Как вы себя чувствуете?")
                .foregroundColor(AppColors.mainColor)
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            HStack(alignment: .center) {
                ForEach(Emotion.Smile.smiles, id: \.self) { smile in
                    let isActive = viewModel.currentEmotion == smile
                    Button {
                        viewModel.set(emotion: smile)
                    } label: {
                        Image(smile.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                            .background(Color.white.cornerRadius(20))
                            .padding(5)
                            .background(isActive ? AnyView(Color.gray.opacity(0.5).cornerRadius(25)) : AnyView(Color.clear))
                        }
                    }
                }
            .padding()
            
            ScrollView(.vertical) {
                VStack {
                    ForEach(coordinator.categories) { category in
                        let isActive = viewModel.category == category
                        Button {
                            viewModel.category = category
                        } label: {
                            Text(category.title!)
                                .font(.system(size: 24, weight: .semibold, design: .default))
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(isActive ? AnyView(AppColors.mainColor) : AnyView(Color.clear))
                                .cornerRadius(15)
                                .foregroundColor(.black)
                        }
                    }
                }
            }
            
            //MARK: SAVE BUTTON
            Button {
                coordinator.updateTaskInDB(description: nameTask, category: viewModel.category, emotion: viewModel.currentEmotion, pair: changePair)
                coordinator.back()
            } label: {
                Text("Сохранить")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(AppColors.mainColor)
                    .cornerRadius(15)
                    .foregroundColor(.white)
            }
            .padding(.top, 20)
            .padding(.horizontal, 40)
            
            Spacer()
        }//:VSTACK
        .onAppear {
            nameTask = changePair.1.task ?? ""
            viewModel.setup(notes: changePair.1)
            
        }
    }
}
