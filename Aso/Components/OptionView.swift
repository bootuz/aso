//
//  OptionView.swift
//  Aso
//
//  Created by Астемир Бозиев on 21.01.2023.
//

import SwiftUI



struct OptionView: View {
    var option: Option

    var body: some View {
        switch option.isMathed {
            case .matched:
                OptionLetter(
                    georgianLetter: option.option,
                    color: .white,
                    backgroundGradient: BackgroundGradient(colors: [Color("lightOrca"), Color("darkOrca")])
                )
            case .unmatched:
                OptionLetter(
                    georgianLetter: option.option,
                    color: .white,
                    backgroundGradient: BackgroundGradient(colors: [Color("namnLight"), Color("namnDark")])
                )
            case .none:
                OptionLetter(
                    georgianLetter: option.option,
                    color: Color("darkMauve"),
                    backgroundGradient: BackgroundGradient(colors: [.white, .white])
                )
        }
    }
}

struct OptionView_Previews: PreviewProvider {

    static var previews: some View {
        OptionView(option: Option(option: "ა"))
            .previewLayout(.sizeThatFits)
    }
}
