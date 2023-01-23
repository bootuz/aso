//
//  SettingsView.swift
//  Kartuli
//
//  Created by Астемир Бозиев on 18.01.2023.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isAutoplayOn") private var isAutoplayOn: Bool = true
    @AppStorage("isDisplayAnswer") private var isDisplayAnswer: Bool = true
    @AppStorage("isShuffled") private var isShuffled: Bool = true

    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            Form {
                Section("Alphabet mode") {
                    Toggle("Random order", isOn: $isShuffled)
                    Toggle("Autoplay", isOn: $isAutoplayOn)
                    Toggle("Show answer", isOn: $isDisplayAnswer)

                }
            }
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
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
