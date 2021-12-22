//
//  MenuView.swift
//  Emotion
//
//  Created by Владислав Бороздин on 16.12.2021.
//

import SwiftUI

struct MenuView: View {
    
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            HStack(alignment: .center, spacing: 14) {
                Image("Instraction1")
                    .resizable()
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
            .background(Color("mainColor"))
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    VStack(alignment: .trailing, spacing: 45) {
                        TabButton(title: "Стиль оформления", image: "Style")
                        TabButton(title: "Уведомления", image: "Notification")
                        TabButton(title: "Поддержка", image: "Support")
                        TabButton(title: "Оставить отзыв", image: "Review")
                    }//:VSTACK
                    .padding()
                    .padding(.trailing)
                    .padding(.top, 5)
                    
                    Text("О нас")
                        .frame(width: 150, height: 30, alignment: .center)
                        .foregroundColor(Color("mainColor"))
                    
                    Text("Hello")
                        .multilineTextAlignment(.center)
                }//:VSTACK
            }//:SCROLL
        }//:VSTACK
        .frame(maxWidth: .infinity, alignment: .trailing)
        .frame(width: getRect().width - 90)
        .frame(maxHeight: .infinity)
        .background(
            Color.white
                .ignoresSafeArea(.container, edges: .vertical)
        )
        .frame(maxWidth: .infinity, alignment: .trailing)
        //.opacity(showMenu ? 1 : 0)
    }
    
    @ViewBuilder
    func TabButton(title: String, image: String) -> some View {
        Button {
            
        } label: {
            HStack(spacing: 14) {
                Image(image)
                    .resizable()
                    .renderingMode(.template)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 22, height: 22)
                
                Text(title)
            }
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(showMenu: .constant(false))
    }
}

extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
}
