//
//  LetterView.swift
//  Kartuli
//
//  Created by Астемир Бозиев on 14.01.2023.
//

import SwiftUI
import AVFoundation

struct CardView: View {
    @ObservedObject var settings: SettingsManager = SettingsManager()
    
    @State private var index: Int = 0
    @State private var isFinished: Bool = false
    @State var letters: [Letter] = Letter.alphabet
    
    @Environment(\.dismiss) var dismiss
    
    let impact = UIImpactFeedbackGenerator(style: .medium)
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    if isFinished {
                        Text("Finished!")
                            .font(.system(size: 80, weight: .bold))
                            .foregroundColor(.white)
                            .shadow(radius: 10, x: 5, y: 5)
                            .frame(height: 300)
                            .padding(.top, 60)
                    } else {
                        Text(letters[index].georgianLetter)
                            .font(.system(size: 300, weight: .medium))
                            .foregroundColor(.white)
                            .shadow(radius: 10, x: 5, y: 5)
                            .onTapGesture {
                                SoundManager.shared.play(sound: letters[index].pronounciation)
                            }
                            .onAppear {
                                if settings.isAutoplayOn {
                                    SoundManager.shared.play(sound: letters[index].pronounciation, delay: 0.3)
                                }
                            }
                        if settings.isDisplayAnswer {
                            Text(letters[index].latinLetter)
                                .font(.system(size: 80, weight: .bold, design: .rounded))
                                .foregroundColor(.white)
                                .shadow(radius: 10, x: 5, y: 5)
                        }
                    }
                }
                Spacer()
                ImageButtonView(icon: isFinished ? .repeat : .next, size: 70) {
                    nextOrRepeat()
                    impact.impactOccurred()
                    if settings.isAutoplayOn && !isFinished {
                        SoundManager.shared.play(sound: letters[index].pronounciation, delay: 0.3)
                    }
                }
            } //: VSTACK
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity)
            .background {
                BackgroundGradient(colors: [Color("blueLight"), Color("blueDark")])
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    if !isFinished {
                        Text("\(index + 1) of \(letters.count)")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.white)
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    ImageButtonView(icon: .xmark, size: 20) {
                        dismiss()
                    }
                }
            }
            .onAppear {
                if settings.isShuffled {
                    letters.shuffle()
                }
            }
        }
        .statusBarHidden()
    }
    
    private func nextOrRepeat() {
        if index < letters.count - 1 && !isFinished {
            index += 1
        } else {
            isFinished.toggle()
            index = 0
            if settings.isShuffled {
                letters.shuffle()
            }
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
