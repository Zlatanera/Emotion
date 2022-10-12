//
//  MainView.swift
//  Emotion
//
//  Created by User on 19.11.2021.
//

import SwiftUI

struct MainView: View {
    //@Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var notes: FetchedResults<Notes>
    
    @EnvironmentObject var coordinator: EmotionCoordinator
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        ZStack {
            List {
                ForEach(coordinator.items, id: \.self.task) { item in
                    RowItem(item: item)
                        .frame(height: 100)
                }
            }
            .listStyle(InsetGroupedListStyle())
            .frame(maxWidth: 640)
            
            .overlay(ZStack {
                Button(action: coordinator.showAddTask) {
                    Image("AddTaskImage")
                        .resizable()
                        .scaledToFit()
                        .background(Circle().fill(Color("mainColor")))
                        .frame(width: 48, height: 48, alignment: .center)
                }
                PulseButton()
                }
                .padding(.bottom, 15)
                .padding(.trailing, 15),
                     alignment: .bottomTrailing
            )
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
                .strokeBorder(Color("mainColor"), lineWidth: 1)
                .background(Circle().foregroundColor(Color("mainColor")))
                .opacity(0.25)
                .frame(width: 80, height: 80)
                .scaleEffect(self.animate ? 1 : 0)
            
            Circle()
                .strokeBorder(Color("mainColor"), lineWidth: 1)
                .background(Circle().foregroundColor(Color("mainColor")))
                .opacity(0.35)
                .frame(width: 70, height: 70)
                .scaleEffect(self.animate ? 1 : 0)
            
            Circle()
                .strokeBorder(Color("mainColor"), lineWidth: 1)
                .background(Circle().foregroundColor(Color("mainColor")))
                .opacity(0.45)
                .frame(width: 60, height: 60)
                .scaleEffect(self.animate ? 1 : 0)
            
            Circle()
                .strokeBorder(Color("mainColor"), lineWidth: 1)
                .background(Circle().foregroundColor(Color("mainColor")))
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

            Image(Emotion.Smile.getEmotionFor(id: Int(item.emotion)).image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .background(Color.white)
                .clipShape(Circle())
                .frame(width: 60, height: 60)
                .padding(5)

            Text(item.task ?? "Empty")
                .font(.footnote)
                .fontWeight(.light)
                .foregroundColor(.white)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
                .padding(.leading, 2)

            HStack {
                ExDivider()
            }
            .padding(.trailing, 3)


            VStack {
                Text("13")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("SEP")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding(.trailing, 5)

        }
        .background(Color("mainColor"))
        .cornerRadius(15)
        .frame(maxWidth: 640)
        .padding(10)

    }
}

struct ExDivider: View {
    let color: Color = .white
    let width: CGFloat = 4
    var body: some View {
        Rectangle()
            .fill(color)
            .frame(height: width)
            .rotationEffect(.degrees(90))
            
    }
}
