//
//  OptionLetter.swift
//  Aso
//
//  Created by Астемир Бозиев on 29.01.2023.
//

import SwiftUI

struct OptionLetter: View {
    let georgianLetter: String
    let color: Color
    let backgroundGradient: BackgroundGradient
    
    var body: some View {
        Text(georgianLetter)
            .font(.system(size: 100, weight: .bold))
            .foregroundColor(color)
            .frame(width: 160, height: 160)
            .background {
                backgroundGradient
            }
            .cornerRadius(20)
            .shadow(radius: 10, x: 5, y: 5)
    }
}

struct OptionLetter_Previews: PreviewProvider {
    static var previews: some View {
        OptionLetter(
            georgianLetter: Letter.alphabet[0].georgianLetter,
            color: Color("darkMauve"),
            backgroundGradient: BackgroundGradient(colors: [.white, .white])
        )
    }
}
