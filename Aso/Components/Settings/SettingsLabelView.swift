//
//  SettingsLabelView.swift
//  Aso
//
//  Created by Астемир Бозиев on 30.01.2023.
//

import SwiftUI

struct SettingsLabelView: View {
    let title: String
    let icon: Image
    let description: String
    var body: some View {
        HStack {
            Label {
                Text(title)
            } icon: {
                icon
            }

            Spacer()
            Text(description)
        }
    }
}

struct SettingsLabelView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLabelView(title: "Developer", icon: Image(systemName: "swift"), description: "Astemir Boziev")
    }
}
