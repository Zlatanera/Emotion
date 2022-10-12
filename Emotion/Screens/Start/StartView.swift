//
//  StartView.swift
//  Emotion
//
//  Created by Владислав Бороздин on 16.12.2021.
//

import SwiftUI

struct StartView: View {
    
    @State var startAnimation: Bool = false
    @State var endAnimation: Bool
    
    var body: some View {
        ZStack {
            AppColors.white
            
            Image("StartScreen")
                .resizable()
                .scaledToFill()
                .opacity(startAnimation ? 1 : 0)
                .frame(width: 220, height: 220)
                .scaleEffect(endAnimation ? 0.15 : 0.9)
            
            VStack {
                Text("Powered by")
                    .font(.callout)
                    .fontWeight(.semibold)
                
                Text("CloudDev")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            .frame(maxHeight: .infinity, alignment: .bottom)
            .foregroundColor(AppColors.mainColor08)
            .padding(.bottom, 15)
            //.opacity(startAnimation ? 1 : 0)
            //.opacity(endAnimation ? 0 : 1)
            
        }//:ZSTACK
        .ignoresSafeArea()
        .onAppear {
            withAnimation(.spring().delay(0.9)) {
                startAnimation.toggle()
            }
            
            withAnimation(.interactiveSpring(response: 0.7, dampingFraction: 1.05, blendDuration: 1.05).delay(1.5)) {
                endAnimation.toggle()
            }
        }
        
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        StartView(endAnimation: true)
    }
}
