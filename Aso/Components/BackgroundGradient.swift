//
//  BackgroundGradient.swift
//  Aso
//
//  Created by Астемир Бозиев on 29.01.2023.
//

import SwiftUI

struct BackgroundGradient: View {
    let colors: [Color]
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
    }
}

struct BackgroundGradient_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundGradient(colors: [Color("blueLight"), Color("blueDark")])
    }
}
