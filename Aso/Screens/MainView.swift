//
//  MainView.swift
//  Kartuli
//
//  Created by Астемир Бозиев on 14.01.2023.
//

import SwiftUI

struct MainView: View {
    @State private var isLetterViewPresented: Bool = false
    @State private var isSettingsPresented: Bool = false
    @State private var isQuizViewPresented: Bool = false

    @AppStorage("isShuffled") private var isShuffled: Bool = true

    var body: some View {
        NavigationView {
            VStack {
                Text("ასო")
                    .foregroundColor(.white)
                    .padding(.bottom, 120)
                    .font(.system(size: 150, weight: .bold))
                    .shadow(radius: 10, x: 5, y: 5)
                VStack(alignment: .center) {
                    LearningModeButton(title: "Alphabet") {
                        isLetterViewPresented.toggle()
                    }
                    .fullScreenCover(isPresented: $isLetterViewPresented) {
                        LetterView(letters: isShuffled ? Letter.alphabet.shuffled() : Letter.alphabet)
                    }
                    LearningModeButton(title: "Quiz") {
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
                LinearGradient(gradient: Gradient(colors: [Color("lightOrca"), Color("darkOrca")]), startPoint: .topLeading, endPoint: .bottomTrailing).edgesIgnoringSafeArea(.all)
            }
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    ImageButtonView(icon: "book.closed.circle.fill", size: 25, weight: .bold) {

                    }

                    ImageButtonView(icon: "gearshape.circle.fill", size: 25, weight: .bold) {
                        isSettingsPresented.toggle()
                    }
                    .sheet(isPresented: $isSettingsPresented) {
                        SettingsView()
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
