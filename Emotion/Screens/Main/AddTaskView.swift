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
    
    @State private var nameTask: String = ""
    @State private var chooseEmotion: Emotion.Smile = .normal
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 20) {
                //MARK: HEADER
                HStack {
                    Image("AddTask")
                        .resizable()
                        .frame(width: 20, height: 20)
                    
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
                    .background(Color.white)
                    .cornerRadius(15)
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .shadow(color: .gray, radius: 15, x: 0, y: 0)
                
            }//:VSTACK
            .padding()
            .background(Color("mainColor"))
            
            //MARK: CHOOSE EMOTION
            Text("Как вы себя чувствуете?")
                .foregroundColor(Color("mainColor"))
                .font(.title2)
                .fontWeight(.semibold)
                .padding(.top, 20)
            
            HStack(alignment: .center, spacing: 20) {
                ForEach(Emotion.Smile.smiles, id: \.self) { smile in
                    Button {
                        chooseEmotion = smile
                    } label: {
                        Image(smile.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 40, height: 40)
                        }
                    }
                }
            .padding()
            
//            //MARK: CHOOSE DATE
//            Text("Укажите дату:")
//                .font(.title2)
//                .fontWeight(.semibold)
//                .foregroundColor(Color("mainColor"))
//                .padding(.top, 20)
            
            //MARK: SAVE BUTTON
            Button {
                coordinator.saveTaskToDB(task: nameTask, emotion: chooseEmotion)
                coordinator.back()
            } label: {
                Text("Сохранить")
                    .font(.system(size: 24, weight: .semibold, design: .default))
                    .padding()
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .background(Color("mainColor"))
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


