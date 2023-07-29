//
//  LetterSelectionView.swift
//  Aso
//
//  Created by Астемир Бозиев on 29.07.2023.
//

import SwiftUI

struct LetterSelectionView: View {
    @ObservedObject private var viewModel = LetterSelectionViewModel()

    var body: some View {
        Form {
            ForEach(Letter.alphabet) { letter in
                if letter.isChosen {
                    HStack {
                        Text(letter.georgianLetter)
                        Spacer()
                        Image(systemName: "checkmark")
                            .foregroundColor(.blue)
                    }
                } else {
                    Text(letter.georgianLetter)
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button {

                } label: {
                    Text("Select all")
                }
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
