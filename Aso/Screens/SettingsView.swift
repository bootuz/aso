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
    @State var isSettingLetterViewPresented: Bool = false
    @Environment(\.dismiss) var dismiss
    let impact = UIImpactFeedbackGenerator(style: .medium)


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
                        title: "Show answer",
                        icon: "eye",
                        toggle: $settings.isDisplayAnswer
                    )
                }
                // MARK: - SECTION 2
//                Section("quiz mode") {
//                    NavigationLink {
//                        LetterSelectionView()
//                    } label: {
//                        Label("Letters", systemImage: "character")
//                    }
//                }
                // MARK: - SECTION 3
                Section("feedback") {
                    SettingsLinkView(
                        title: "Review app",
                        url: settings.reviewLink,
                        icon: Image(systemName: "star")
                    )
                    SettingsLinkView(
                        title: "Feature request",
                        url: settings.igMeLink,
                        icon: Image(systemName: "bubble.right")
                    )
                }
                // MARK: - SECTION 4
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
                        url: settings.instagramLink,
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
            .preferredColorScheme(.light)
        }
    }

    private func rateApp() {
        guard let url = URL(string: settings.urlString), UIApplication.shared.canOpenURL(url) else { return }
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
