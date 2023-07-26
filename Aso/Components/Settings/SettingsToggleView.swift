//
//  SettingsToggle.swift
//  Aso
//
//  Created by Астемир Бозиев on 29.01.2023.
//

import SwiftUI

struct SettingsToggleView: View {
    let title: String
    let icon: String
    @Binding var toggle: Bool
    var body: some View {
        HStack {
            Label {
                Text(title)
            } icon: {
                if toggle {
                    Image(systemName: icon)
                        .foregroundColor(.blue)
                } else {
                    Image(systemName: icon)
                        .foregroundColor(.gray)
                }
            }
            Spacer()
            Toggle(isOn: $toggle) {}
        }
    }
}

struct SettingsToggle_Previews: PreviewProvider {
    @State private static var toggle: Bool = true
    static var previews: some View {
        SettingsToggleView(title: "Random order", icon: "shuffle", toggle: $toggle)
    }
}
