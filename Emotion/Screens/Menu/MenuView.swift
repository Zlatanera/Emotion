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
        VStack(alignment: .leading, spacing: 0) { //trailing
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
                    VStack(alignment: .leading, spacing: 45) { //trailing
                        TabButton(title: "Стиль оформления", image: "Style", action: { coordinator?.showStats() } )
                        TabButton(title: "Уведомления", image: "Notification", action: {  })
                        TabButton(title: "Поддержка", image: "Support", action: {  }) //\(AppImages.SupportImage())
                        TabButton(title: "Оставить отзыв", image: "Review", action: {  })
                    }//:VSTACK
                    .padding(6)
                    .padding(.leading) //trailing
                    .padding(.top, 5)
                    
                    Text("О нас")
                        .frame(width: 150, height: 30, alignment: .center)
                        .foregroundColor(AppColors.mainColor)
                    
                    Text("Hello")
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
