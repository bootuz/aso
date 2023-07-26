//
//  LogoView.swift
//  Aso
//
//  Created by Астемир Бозиев on 29.01.2023.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Text("ასო")
            .foregroundColor(.white)
            .font(.system(size: 150, weight: .bold))
            .shadow(radius: 10, x: 5, y: 5)
    }
}

struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        LogoView()
            .previewLayout(.sizeThatFits)
            .background {
                BackgroundGradient(colors: [Color("lightOrca"), Color("darkOrca")])
            }
    }
}
