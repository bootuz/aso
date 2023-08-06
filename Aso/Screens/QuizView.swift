//
//  QuizView.swift
//  Aso
//
//  Created by Астемир Бозиев on 21.01.2023.
//

import SwiftUI
import AVFoundation

struct QuizView: View {
    @ObservedObject var quizManager: QuizManager = QuizManager()

    @State private var isResultsPresented: Bool = false
    @State private var isDisabled: Bool = false

    var columns: [GridItem] = Array(repeating: GridItem(.fixed(175), spacing: 0), count: 2)

    @Environment(\.dismiss) var dismiss

    var body: some View {
        NavigationView {
            if quizManager.quizCompleted {
                ZStack {
                    VStack {
                        Text("Finished!")
                            .font(.system(size: 60, weight: .bold, design: .rounded))
                        Text("Your score:\n \(quizManager.successGuesses) of \(QuizManager.questions.count)")
                            .padding(.top)
                            .font(.system(size: 40, weight: .medium, design: .rounded))
                    }
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(minWidth: 0,
                           maxWidth: .infinity,
                           minHeight: 0,
                           maxHeight: .infinity)
                    .background {
                        BackgroundGradient(colors: [Color("lightMauve"), Color("darkMauve")])
                    }
                    VStack {
                        Spacer()
                        ImageButtonView(icon: .repeat, size: 70) {
                            quizManager.restartQuiz()
                            isDisabled = false
                        }
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ImageButtonView(icon: .xmark, size: 20) {
                            dismiss()
                            quizManager.resetQuiz()
                        }
                    }
                }
            } else {
                VStack {
                    Spacer()
                    Text(quizManager.question.title)
                        .foregroundColor(.white)
                        .font(.system(size: 200, weight: .bold, design: .rounded))
                        .shadow(radius: 10, x: 5, y: 5)
                        .padding(.bottom, 30)
                        .onAppear {
                            SoundManager.shared.play(sound: quizManager.question.pronounciation, delay: 0.2)
                        }
                        .onChange(of: quizManager.question.title) { _ in
                            SoundManager.shared.play(sound: quizManager.question.pronounciation, delay: 0.2)
                            isDisabled = false
                        }
                    Spacer()
                    LazyVGrid(columns: columns, spacing: 13) {
                        ForEach(quizManager.question.options) { option in
                            OptionView(option: option)
                                .onTapGesture {
                                    quizManager.verifyAnswer(selectedOption: option)
                                    isDisabled = true
                                }
                        }
                    }
                    .disabled(isDisabled)
                    .padding(.bottom, 40)
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: .infinity)
                .background {
                    BackgroundGradient(colors: [Color("lightMauve"), Color("darkMauve")])
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        ImageButtonView(icon: .xmark, size: 20) {
                            dismiss()
                            quizManager.resetQuiz()
                        }
                    }
                    ToolbarItem(placement: .principal) {
                        if !quizManager.quizCompleted {
                            Text("\(QuizManager.currentIndex) of \(QuizManager.questions.count)")
                                .font(.system(size: 13, weight: .semibold))
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
        .statusBarHidden()
    }
}

struct QuizView_Previews: PreviewProvider {
    @State static var isDisabled: Bool = false
    static var previews: some View {
        QuizView()
    }
}
