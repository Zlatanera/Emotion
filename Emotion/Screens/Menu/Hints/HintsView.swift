//
//  HintsView.swift
//  Emotion
//
//  Created by Владислав Бороздин on 29.11.2022.
//

import SwiftUI

struct HintsView: View {
    var body: some View {
        VStack {
            ZStack {
                HStack {
                    Text("Подсказки")
                }
                .padding(.leading, 5)
            }
            Spacer()
        }//:VSTACK
    }
}

struct HintsView_Previews: PreviewProvider {
    static var previews: some View {
        HintsView()
    }
}
