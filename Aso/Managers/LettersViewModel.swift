//
//  LetterSelectionManager.swift
//  Aso
//
//  Created by Астемир Бозиев on 29.07.2023.
//

import Foundation


class LettersViewModel: ObservableObject {
    @Published var allLetters: [Letter] = [] {
        didSet {
            saveLettersToUserDefaults()
        }
    }

    var selectedLetters: [Letter] = []

    init() {
        loadLettersFromUserDefaults()
    }

    private let chosenLettersKey = "ChosenLetters"

    private func saveLettersToUserDefaults() {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(allLetters) {
            UserDefaults.standard.set(encoded, forKey: chosenLettersKey)
        }
    }

    private func loadLettersFromUserDefaults() {
        if let data = UserDefaults.standard.data(forKey: chosenLettersKey) {
            let decoder = JSONDecoder()
            if let decoded = try? decoder.decode([Letter].self, from: data) {
                selectedLetters = decoded
            }
        }
    }

    func updateIsChosen(for letter: Letter, isChosen: Bool) {
        if let index = allLetters.firstIndex(where: { $0.id == letter.id }) {
            allLetters[index].isChosen = isChosen
        }
    }
}

