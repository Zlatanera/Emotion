//
//  SettingsView.swift
//  Emotion
//
//  Created by User on 19.11.2021.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var coordinator: EmotionCoordinator
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var viewModel = AddTaskViewModel()
    
    @State private var nameTask: String = ""
    
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
            
            //MARK: SAVE BUTTON
            Button {
                coordinator.saveTaskToDB(description: nameTask, emotion: viewModel.currentEmotion)
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
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

//MARK: Date Picker
struct CustomDatePicker: View {
    
    @Binding var date: Date
    @Binding var showPicker: Bool
    
    var body: some View {
    
    ZStack {
        
        Rectangle()
            .fill(.ultraThinMaterial)
        
        DatePicker("", selection: $date, displayedComponents: [.date, .hourAndMinute])
            .labelsHidden()
        }
        .opacity(showPicker ? 1 : 0)
    }
}


