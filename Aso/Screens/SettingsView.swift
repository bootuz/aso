//
//  SettingsView.swift
//  Kartuli
//
//  Created by Астемир Бозиев on 18.01.2023.
//

import StoreKit
import SwiftUI

struct SettingsView: View {
    @ObservedObject var settings: SettingsManager
    @Environment(\.dismiss) var dismiss
    let impact = UIImpactFeedbackGenerator(style: .medium)

    let instagramLink = "https://www.instagram.com/astemirboziy/"
    let igMeLink = "https://ig.me/m/astemirboziy"
    let urlString = "https://itunes.apple.com/app/1?action=write-review"
    let reviewLink = "https://itunes.apple.com/app/1?action=write-review"

    var body: some View {
        NavigationView {
            Form {
                // MARK: - SECTION 1
                Section("cards mode") {
                    SettingsToggleView(
                        title: "Shuffle",
                        icon: "shuffle",
                        toggle: $settings.isShuffled
                    )
                    SettingsToggleView(
                        title: "Autoplay",
                        icon: "speaker.wave.3",
                        toggle: $settings.isAutoplayOn
                    )
                    SettingsToggleView(
                        title: "Tanslit",
                        icon: "eye",
                        toggle: $settings.isDisplayAnswer
                    )
                }
                // MARK: - SECTION 2
                Section("feedback") {
                    SettingsLinkView(
                        title: "Review app",
                        url: reviewLink,
                        icon: Image(systemName: "star")
                    )
                    SettingsLinkView(
                        title: "Feature request",
                        url: igMeLink,
                        icon: Image(systemName: "bubble.right")
                    )
                }
                // MARK: - SECTION 3
                Section("app info") {
                    SettingsLabelView(
                        title: "Developer",
                        icon: Image(systemName: "swift"),
                        description: "Astemir Boziev"
                    )
                    SettingsLabelView(
                        title: "App version",
                        icon: Image("appstore"),
                        description: "1.0"
                    )
                    SettingsLinkView(
                        title: "Intagram",
                        url: instagramLink,
                        icon: Image("instagram")
                    )
                }
            } // MARK: - FORM END
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button {
                        dismiss()
                    } label: {
                        Text("Done")
                    }
                }
            }
        }
    }

    private func rateApp() {
        guard let url = URL(string: urlString), UIApplication.shared.canOpenURL(url) else { return }
        UIApplication.shared.open(url, options: [:], completionHandler: nil)
    }

    private func requestReview() {
        if let currentScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            SKStoreReviewController.requestReview(in: currentScene)
        }
    }

}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(settings: SettingsManager())
    }
}
