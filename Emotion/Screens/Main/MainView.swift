//
//  MainView.swift
//  Emotion
//
//  Created by User on 19.11.2021.
//

import SwiftUI

struct MainView: View {
    
    
    @EnvironmentObject var coordinator: EmotionCoordinator
    @Environment(\.colorScheme) var colorScheme
    
    @State var showMenu: Bool = false
    
    var body: some View {
        
        ZStack(alignment: .leading) {
            List {
                ForEach(Array(coordinator.items.enumerated()), id: \.self.0) { pair in
                    Button {
                        coordinator.changeTask(pair: pair)
                    } label: {
                        RowItem(item: pair.1)
                            
                    }
                    .listRowInsets(EdgeInsets())
                }
                .onDelete(perform: coordinator.delete)
            }
            .frame(maxWidth: 640)
            
            .overlay(
                    Button(action: {
                        withAnimation {
                            showMenu.toggle()
                        }
                    }) {
                        AppImages.MenuImage()
                            .frame(width: 20, height: 20, alignment: .center)
                    }
                .padding(.top , 10)
                .padding(.leading, 15),
                alignment: .topLeading
            )
            
            .overlay(ZStack {
                Button(action: coordinator.showAddTask) {
                    AppImages.addTaskImage()
                        .background(Circle().fill(AppColors.mainColor))
                        .frame(width: 48, height: 48, alignment: .center)
                }
                PulseButton()
                }
                .padding(.bottom, 15)
                .padding(.trailing, 15),
                     alignment: .bottomTrailing
            )
            MenuView(showMenu: $showMenu, coordinator: coordinator)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

struct PulseButton: View {
    
    @State var animate = false
    
    var body: some View {
        ZStack {
            Circle()
                .strokeBorder(AppColors.mainColor, lineWidth: 1)
                .background(Circle().foregroundColor(AppColors.mainColor))
                .opacity(0.25)
                .frame(width: 80, height: 80)
                .scaleEffect(self.animate ? 1 : 0)
            
            Circle()
                .strokeBorder(AppColors.mainColor, lineWidth: 1)
                .background(Circle().foregroundColor(AppColors.mainColor))
                .opacity(0.35)
                .frame(width: 70, height: 70)
                .scaleEffect(self.animate ? 1 : 0)
            
            Circle()
                .strokeBorder(AppColors.mainColor, lineWidth: 1)
                .background(Circle().foregroundColor(AppColors.mainColor))
                .opacity(0.45)
                .frame(width: 60, height: 60)
                .scaleEffect(self.animate ? 1 : 0)
            
            Circle()
                .strokeBorder(AppColors.mainColor, lineWidth: 1)
                .background(Circle().foregroundColor(AppColors.mainColor))
                .opacity(0.55)
                .frame(width: 50, height: 50)
                .scaleEffect(self.animate ? 1 : 0)
            
        }.onAppear {
            self.animate.toggle()
        }
        .animation(Animation.linear(duration: 1.5).repeatForever(autoreverses: false))
    }
}

struct RowItem: View {
    
    let item: Notes
    
    var body: some View {
        
        HStack {

            Image(Emotion.Smile.getEmotionFor(id: item.emotion).image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .background(AppColors.white)
                .clipShape(Circle())
                .frame(width: 60, height: 60)

            Text(item.task ?? "Empty")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
                .padding(.leading, 2)

            Spacer()
            
            Divider()
                .background(Color.black)
                .frame(width: 4)

            VStack {
                Text(item.dayS)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text(item.monthS)
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .frame(width: 80)
        }
        .padding(.horizontal, 5)
        .background(AppColors.mainColor)
        .cornerRadius(15)
        .frame(maxWidth: 640)
        .padding(10)
        .frame(height: 100)
    }
}
