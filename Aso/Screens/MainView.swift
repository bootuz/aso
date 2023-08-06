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
                Text("ასო")
                    .foregroundColor(.white)
                    .font(.system(size: 150, weight: .bold))
                    .shadow(radius: 10, x: 5, y: 5)
                VStack(alignment: .center) {
                    LearningModeButtonView(title: "Cards") {
                        isLetterViewPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isLetterViewPresented) {
                        CardView()
                    }
                    LearningModeButtonView(title: "Quiz") {
                        isQuizViewPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isQuizViewPresented) {
                        QuizView()
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
        .preferredColorScheme(.dark)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
