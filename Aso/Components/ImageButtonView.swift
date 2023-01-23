//
//  ImageButton.swift
//  Aso
//
//  Created by Астемир Бозиев on 22.01.2023.
//

import SwiftUI

struct ImageButtonView: View {
    var icon: String
    var size: CGFloat
    var weight: Font.Weight = .regular
    var tapped: () -> Void

    var body: some View {
        Button {
            tapped()
        } label: {
            Image(systemName: icon)
                .symbolRenderingMode(.hierarchical)
                .font(.system(size: size, weight: weight))
                .foregroundColor(.white)
        }
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButtonView(icon: "gearshape.circle.fill", size: 25) {

        }
        .previewLayout(.sizeThatFits)
    }
}
