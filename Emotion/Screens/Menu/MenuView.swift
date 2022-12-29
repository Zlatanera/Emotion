//
//  MenuView.swift
//  Emotion
//
//  Created by Владислав Бороздин on 16.12.2021.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var showMenu: Bool
    
    let coordinator: EmotionCoordinator?
    
    private let halfScreenWidth = UIScreen.main.bounds.width / 2
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            HStack(alignment: .center, spacing: 14) {
                AppImages.instruction1()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 65, height: 65)
                    .clipShape(Circle())
                
                VStack(alignment: .trailing, spacing: 14) {
                    Text("Emoutionly")
                        .font(.title2.bold())
                        .frame(width: 130, height: 30, alignment: .center)
                        .multilineTextAlignment(.center)
                        .lineLimit(1)
                        .foregroundColor(.white)
                }//:VSTACK
            }//:HSTACK
            .background(AppColors.mainColor)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack(alignment: .leading, spacing: 45) {
                        TabButton(title: "Статистика", image: "Statistics", action: { coordinator?.showStats() } )
                        TabButton(title: "Подсказки", image: "Hints", action: { coordinator?.showHints() })
                        TabButton(title: "Поддержка", image: "Support", action: { coordinator?.showMail() })
                        TabButton(title: "Настройки", image: "Review", action: {  })
                    }//:VSTACK
                    .padding(10)
                    .padding(.leading) //trailing
                    .padding(.top, 5)
                    
                    Text("О проекте")
                        .frame(width: 150, height: 30, alignment: .center)
                        .foregroundColor(AppColors.mainColor)
                    
                    Text("Это приложение родом из Сибири, где люди не так часто выражать свои эмоции, но от этого они не становятся хуже. Данный проект реализован, чтобы помочь людям, следить за своим состоянием, а также поддерживать их в трудную минуту")
                        .multilineTextAlignment(.center)
                }//:VSTACK
            }//:SCROLL
        }//:VSTACK
        .frame(maxHeight: .infinity)
        .background(
            Color.white
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .gesture(
            DragGesture(minimumDistance: 50)
                .onEnded { endedGesture in
                    if (endedGesture.location.x - endedGesture.startLocation.x) < 0 {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }
                }
        )
        .opacity(showMenu ? 1 : 0)
        .frame(width: halfScreenWidth, alignment: .leading)
        .offset(x: showMenu ? .zero : -halfScreenWidth)
    }
    
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(showMenu: .constant(false), coordinator: nil)
    }
}

struct TabButton: View {
    
    let title: String
    let image: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            HStack(spacing: 14) {
                Image(image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: 180, alignment: .leading) //infinity, trailing
        }
    }
}


