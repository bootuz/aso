//
//  LearningModeButton.swift
//  Aso
//
//  Created by Астемир Бозиев on 22.01.2023.
//

import SwiftUI

struct LearningModeButtonView: View {
    var title: String
    var action: (() -> Void)

    var body: some View {
        Button {
            action()
        } label: {
            Text(title)
                .font(.system(size: 40, weight: .bold, design: .rounded))
                .frame(width: 270, height: 100)
                .foregroundColor(Color("darkOrca"))
                .background {
                    Color.white
                }
                .cornerRadius(50)
        }
        .shadow(radius: 10, x: 5, y: 5)
    }
}

struct LearningModeButton_Previews: PreviewProvider {
    static var previews: some View {
        LearningModeButtonView(title: "Quiz") {

        }
        .previewLayout(.sizeThatFits)
    }
}
