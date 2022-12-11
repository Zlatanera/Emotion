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
    
    let count: Int
    
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
                        
                        Text("Постарайтесь фиксировать те моменты, которые вызывают у вас определенные эмоции и пишите кратку заметку, которую можно будет посмотреть спустя время")
                            .italic()
                            .multilineTextAlignment(.center)
                            .foregroundColor(AppColors.mainColor)
                    }//:HSTACK
                    .frame(height: 250)
                    
                    HStack {
                        AppImages.instruction2()
                        
                        Text("Постарайтесь фиксировать те моменты, которые вызывают у вас определенные эмоции и пишите кратку заметку, которую можно будет посмотреть спустя время")
                            .italic()
                            .multilineTextAlignment(.center)
                            .foregroundColor(AppColors.mainColor)
                    }//:HSTACK
                    .frame(height: 250)
                    
                    HStack {
                        AppImages.instruction3()
                        
                        Text("Постарайтесь фиксировать те моменты, которые вызывают у вас определенные эмоции и пишите кратку заметку, которую можно будет посмотреть спустя время")
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
            viewModel.updateTaskCount(taskCount: count)
        }
    }
}

struct HintsView_Previews: PreviewProvider {
    static var previews: some View {
        HintsView(count: 1)
    }
}
