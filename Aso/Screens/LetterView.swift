//
//  LetterView.swift
//  Kartuli
//
//  Created by Астемир Бозиев on 14.01.2023.
//

import SwiftUI
import AVFoundation

struct LetterView: View {
    @AppStorage("isAutoplayOn") private var isAutoplayOn: Bool = true
    @AppStorage("isDisplayAnswer") private var isDisplayAnswer: Bool = true
    @AppStorage("isShuffled") private var isShuffled: Bool = true

    @State private var index: Int = 0
    @State private var isFinished: Bool = false
    @State private var player: AVPlayer?
    @State var letters: [Letter]
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
                                play(sound: letters[index].pronounciation)
                            }
                            .onAppear {
                                if isAutoplayOn {
                                    playAfterDelay(sound: letters[index].pronounciation)
                                }
                            }
                        Text(letters[index].latinLetter)
                            .font(.system(size: 80, weight: .bold, design: .rounded))
                            .foregroundColor(.white)
                            .shadow(radius: 10, x: 5, y: 5)
                            .if(!isDisplayAnswer) { view in
                                view.hidden()
                            }
                    }
                }
                Spacer()
                ImageButtonView(icon: isFinished ? "repeat.circle.fill" : "arrow.right.circle.fill", size: 70) {
                    if index < letters.count - 1 && !isFinished {
                        index += 1
                    } else {
                        isFinished.toggle()
                        index = 0
                        if isShuffled {
                            letters.shuffle()
                        }

                    }
                    impact.impactOccurred()
                    if isAutoplayOn && !isFinished {
                        playAfterDelay(sound: letters[index].pronounciation)
                    }
                }
            } //: VSTACK
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity)
            .background {
                LinearGradient(gradient: Gradient(colors: [Color("blueLight"), Color("blueDark")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)

            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text("\(index + 1) of \(letters.count)")
                        .font(.system(size: 13))
                        .foregroundColor(.white)
                        .if(isFinished) { view in
                            view.hidden()
                        }
                        .padding(.top)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    ImageButtonView(icon: "xmark.circle.fill", size: 20) {
                        dismiss()
                    }
                }
            }
        }
        .statusBarHidden()
        
    }

    private func play(sound: String) {
        self.player = AVPlayer.preparedPlayer(with: sound)
        self.player?.play()
    }
    private func playAfterDelay(sound: String) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            play(sound: sound)
        }
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct LetterView_Previews: PreviewProvider {
    static var previews: some View {
        LetterView(letters: Letter.alphabet)
    }
}
