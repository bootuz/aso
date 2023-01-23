//
//  OptionView.swift
//  Aso
//
//  Created by Астемир Бозиев on 21.01.2023.
//

import SwiftUI

struct OptionView: View {
    private let generator = UINotificationFeedbackGenerator()

    let option: String
    var body: some View {
        Button {
            generator.notificationOccurred(.success)
        } label: {
            Text(option)
                .font(.system(size: 100, weight: .bold))
                .foregroundColor(Color("darkMauve"))
                .frame(width: 160, height: 160)
                .background {
                    Color.white
                }
                .cornerRadius(20)
                .shadow(radius: 10, x: 5, y: 5)
            
        }
    }
}

struct OptionView_Previews: PreviewProvider {
    private static let option = "ა"
    static var previews: some View {
        OptionView(option: option)
            .previewLayout(.sizeThatFits)
    }
}
