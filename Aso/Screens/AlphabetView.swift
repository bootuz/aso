//
//  AlphabetView.swift
//  Aso
//
//  Created by Астемир Бозиев on 24.01.2023.
//

import SwiftUI
import AVFoundation

struct AlphabetView: View {
    @Environment(\.dismiss) var dismiss

    let columns = [GridItem(.adaptive(minimum: 70))]

    var body: some View {
        NavigationView {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(Letter.alphabet) { letter in
                            ButtonView(letter: letter)
                        }
                    }
                }
                .scrollIndicators(.hidden)
                .padding(.horizontal)
                .background {
                    BackgroundGradient(colors: [Color("namnLight"), Color("namnDark")])
                }
                .navigationTitle("Alphabet")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ImageButtonView(icon: .xmark, size: 20) {
                            dismiss()
                        }
                    }
                }
                .navigationBarTitleDisplayMode(.large)
        }
        .preferredColorScheme(.dark)
    }
}


struct ButtonView: View {
    let letter: Letter
    @State private var player: AVPlayer?

    var body: some View {
        Button {
            play(sound: letter.pronounciation)
        } label: {
            VStack {
                Text(letter.georgianLetter)
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.white)
                    .padding(.bottom, 0)
                Text(letter.latinLetter)
                    .font(.system(size: 30, weight: .bold, design: .rounded))
                    .padding(.bottom)
                    .foregroundColor(.white)

            }
            .shadow(radius: 10, x: 5, y: 5)
        }
    }

    private func play(sound: String) {
        self.player = AVPlayer.preparedPlayer(with: sound)
        self.player?.play()
    }
}

struct AlphabetView_Previews: PreviewProvider {
    static var previews: some View {
        AlphabetView()
        ButtonView(letter: Letter.alphabet[0])
            .previewLayout(.sizeThatFits)
    }
}
