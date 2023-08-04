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
        List(viewModel.allLetters, selection: $selectKeeper) { letter in
            HStack {
                Button {
                    viewModel.updateIsChosen(for: letter, isChosen: !letter.isChosen)
                } label: {
                    Label {
                        Text("\(letter.georgianLetter) - \(letter.latinLetter)")
                            .font(.system(size: 20))
                            .fontWeight(.medium)
                            .foregroundColor(.black)
                        Spacer()
                        if letter.isChosen {
                            Image(systemName: "checkmark")
                        }
                    } icon: {
                        EmptyView()
                    }
                }
            }
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Select all") {
                    for letter in viewModel.allLetters {
                        viewModel.updateIsChosen(for: letter, isChosen: true)
                    }
                }
            }
        }
        .navigationTitle("Letters")
    }
}

struct LetterSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LetterSelectionView()
        }
    }
}
