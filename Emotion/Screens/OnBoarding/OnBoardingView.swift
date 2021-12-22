//
//  OnBoardingView.swift
//  Emotion
//
//  Created by Владислав Бороздин on 16.12.2021.
//

import SwiftUI

struct OnBoardingView: View {
    
    var cardOnBoarding: [OnBoardingCard] = onBoardingCardData
    
    var body: some View {
        TabView {
            ForEach(cardOnBoarding[0...2]) { item in
                
                OnBoardingCardView(card: item)
                
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .padding(.vertical, 20)
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView(cardOnBoarding: onBoardingCardData)
            .background(Color("mainColor"))
            .ignoresSafeArea(.all)
    }
}

//MARK: Card

struct OnBoardingCardView: View {
    
    var card: OnBoardingCard
    
    @State private var isAnimating: Bool = false
    
    var body: some View {
        
        ZStack {
            VStack(spacing: 20) {
                // EMOTION: Image
                
                Image(card.image)
                    .resizable()
                    .scaledToFit()
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 8, x: 6, y: 8)
                    .scaleEffect(isAnimating ? 1.0 : 0.6)
                
                Text(card.description)
                    .foregroundColor(Color("mainColor"))
                    .font(.system(size: 24, weight: .semibold, design: .rounded))
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.15), radius: 2, x: 2, y: 2)
                    .multilineTextAlignment(.center)
                
                    StartButtonView()
            }
        }
        .onAppear {
            withAnimation(.easeOut(duration: 0.5)) {
                isAnimating = true
            }
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
        .background(Color.white)
        .cornerRadius(20)
        .padding(.horizontal, 20)
        
    }
}

struct EmotionCardView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingCardView(card: onBoardingCardData[1])
            .previewLayout(.fixed(width: 320, height: 560))
    }
}

//MARK: Start Button

struct StartButtonView: View {
    
    @AppStorage("isOnboarding") var isOnboarding: Bool?
    
    var body: some View {
        Button {
            isOnboarding = false
        } label: {
            HStack(spacing: 8) {
                Text("Start")
                
                Image(systemName: "arrow.right.circle")
                    .imageScale(.large)
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 10)
            .background(
                Capsule().strokeBorder(Color("mainColor"), lineWidth: 1.25)
            )
        }
        .accentColor(Color("mainColor"))

    }
}

struct StartButtonView_Previews: PreviewProvider {
    static var previews: some View {
        StartButtonView()
            .previewLayout(.sizeThatFits)
    }
}


