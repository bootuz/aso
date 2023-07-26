//
//  MainView.swift
//  Kartuli
//
//  Created by Астемир Бозиев on 14.01.2023.
//

import SwiftUI

struct MainView: View {
    @State private var isSettingsPresented: Bool = false
    @State private var isQuizViewPresented: Bool = false
    @State private var isLetterViewPresented: Bool = false
    @State private var isAlphabetViewPresented: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 130) {
                LogoView()
                VStack(alignment: .center) {
                    LearningModeButtonView(title: "Cards") {
                        isLetterViewPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isLetterViewPresented) {
                        LetterView(settings: SettingsManager())
                    }
                    LearningModeButtonView(title: "Quiz") {
                        isQuizViewPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isQuizViewPresented) {
                        QuizView(quizManager: QuizManager())
                    }
                    .padding(.top)
                }
            }
            .frame(minWidth: 0,
                   maxWidth: .infinity,
                   minHeight: 0,
                   maxHeight: .infinity)
            .background {
                BackgroundGradient(colors: [Color("lightOrca"), Color("darkOrca")])
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    ImageButtonView(icon: .book, size: 25, weight: .bold) {
                        isAlphabetViewPresented.toggle()
                    }
                    .popover(isPresented: $isAlphabetViewPresented) {
                        AlphabetView()
                    }

                    ImageButtonView(icon: .gear, size: 25, weight: .bold) {
                        isSettingsPresented.toggle()
                    }
                    .popover(isPresented: $isSettingsPresented) {
                        SettingsView(settings: SettingsManager())
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
