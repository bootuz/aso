//
//  ImageButton.swift
//  Aso
//
//  Created by Астемир Бозиев on 22.01.2023.
//

import SwiftUI

struct ImageButtonView: View {
    var icon: Icon
    var size: CGFloat
    var weight: Font.Weight = .regular
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Image(systemName: icon.rawValue)
                .symbolRenderingMode(.hierarchical)
                .font(.system(size: size, weight: weight))
                .foregroundColor(.white)
        }
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButtonView(icon: .xmark, size: 25) {
            
        }
        .preferredColorScheme(.dark)
        .previewLayout(.sizeThatFits)
    }
}
