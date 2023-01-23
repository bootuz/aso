//
//  LearningModeButton.swift
//  Aso
//
//  Created by Астемир Бозиев on 22.01.2023.
//

import SwiftUI

struct LearningModeButton: View {
    var title: String
    var tapped: (() -> Void)


    var body: some View {
        Button {
            tapped()
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
        LearningModeButton(title: "Quiz") {

        }
        .previewLayout(.sizeThatFits)
    }
}
