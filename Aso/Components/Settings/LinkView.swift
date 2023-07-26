//
//  LinkView.swift
//  Aso
//
//  Created by Астемир Бозиев on 30.01.2023.
//

import SwiftUI

struct SettingsLinkView: View {
    let title: String
    let url: String
    let icon: Image
    var body: some View {
        Link(destination: URL(string: url)!) {
            HStack {
                Label {
                    Text(title)
                        .foregroundColor(.primary)
                } icon: {
                    icon
                }
                Spacer()
                Image(systemName: "arrow.up.forward.app")
                    .foregroundColor(.pink)
                    .font(.system(size: 10))
            }
        }
    }
}

struct LinkView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsLinkView(title: "Feature request", url: "https://ig.me/m/astemirboziy", icon: Image(systemName: "bubble.right"))
            .previewLayout(.sizeThatFits)
    }
}
