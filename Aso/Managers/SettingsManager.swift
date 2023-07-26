//
//  SettingsManager.swift
//  Aso
//
//  Created by Астемир Бозиев on 29.01.2023.
//

import SwiftUI

class SettingsManager: ObservableObject {
    // MARK: - ALPHABET MODE
    @AppStorage("isShuffled") var isShuffled: Bool = false
    @AppStorage("isAutoplayOn") var isAutoplayOn: Bool = true
    @AppStorage("isDisplayAnswer") var isDisplayAnswer: Bool = true
}
