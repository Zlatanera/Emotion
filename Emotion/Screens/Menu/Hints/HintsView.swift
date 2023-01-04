//
//  HintsView.swift
//  Emotion
//
//  Created by Владислав Бороздин on 29.11.2022.
//

import SwiftUI
import UserNotifications

struct HintsView: View {
    
    @EnvironmentObject var coordinator: EmotionCoordinator
    @ObservedObject var viewModel = HintsViewModel()
    
    let notes: [Notes]
    
    var body: some View {
        VStack {
            VStack(alignment: .center, spacing: 20) {
                //MARK: HEADER
                HStack {
                    
                    Text("Подсказки")
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
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(alignment: .leading) {
                    HStack {
                        AppImages.instruction1()
                        
                        Text("Постарайтесь фиксировать те моменты, которые вызывают у вас определенные эмоции и пишите краткую заметку, которую можно будет посмотреть спустя время")
                            .italic()
                            .multilineTextAlignment(.center)
                            .foregroundColor(AppColors.mainColor)
                    }//:HSTACK
                    .frame(height: 250)
                    
                    HStack {
                        AppImages.instruction2()
                        
                        Text("Если вы понимаете, что ваше настроение изменилось после создания определенной заметки, актуализируйте информацию, чтобы не запутаться в будущем")
                            .italic()
                            .multilineTextAlignment(.center)
                            .foregroundColor(AppColors.mainColor)
                    }//:HSTACK
                    .frame(height: 250)
                    
                    HStack {
                        AppImages.instruction3()
                        
                        Text("Старайтесь писать кратко, так вы сможете быстро понять, что вы имели в виду")
                            .italic()
                            .multilineTextAlignment(.center)
                            .foregroundColor(AppColors.mainColor)
                    }//:HSTACK
                    .frame(height: 250)
                    
                    HStack {
                        Image(systemName: "heart.circle.fill")
                            .resizable()
                            .foregroundColor(viewModel.enoughTaskCount ? AppColors.veryHappy : AppColors.normal)
                            .frame(width: 80, height: 80)
                            
                        Spacer()
                        
                        Text("В данный момент у вас/10")//\(viewModel.enoughTaskCount.count)
                            .foregroundColor(AppColors.mainColor)
                    }//:HSTACK
                    .frame(height: 100)
                    
                }//:VSTACK
            }//:SCROLL
            
            Spacer()
        }
        .onAppear {
            viewModel.updateCountEmotion(notes: notes)
        }
    }
}

struct HintsView_Previews: PreviewProvider {
    static var previews: some View {
        HintsView(notes: [])
    }
}
