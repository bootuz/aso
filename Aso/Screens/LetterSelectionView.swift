//
//  LetterSelectionView.swift
//  Aso
//
//  Created by Астемир Бозиев on 29.07.2023.
//

import SwiftUI

struct LetterSelectionView: View {
    @ObservedObject private var viewModel = LettersViewModel()
    @State var selectKeeper = Set<Letter>()

    var body: some View {
        List(Letter.alphabet, selection: $selectKeeper) { letter in
            HStack {
                Text(letter.georgianLetter)
                Spacer()
                if letter.isChosen {
                    Image(systemName: "checkmark")
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                EditButton()
            }
        }
        .navigationTitle("Letters")
    }
}

struct LetterSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        LetterSelectionView()
    }
}
