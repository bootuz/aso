//
//  QuizManager.swift
//  Aso
//
//  Created by Астемир Бозиев on 26.01.2023.
//

import Algorithms
import Foundation
import SwiftUI


class QuizManager: ObservableObject {
    private let generator = UINotificationFeedbackGenerator()

    static var currentIndex: Int = 0
    @Published var question: Question = QuizManager.getQuestion()

    var successGuesses: Int = 0
    @Published var quizCompleted: Bool = false


    func verifyAnswer(selectedOption: Option) {
        guard let index = question.options.firstIndex(of: selectedOption) else { return }
        if self.question.asnwer.option == selectedOption.option {
            question.options[index].isMathed = .matched
            successGuesses += 1
            generator.notificationOccurred(.success)
        } else {
            question.options[index].isMathed = .unmatched
            generator.notificationOccurred(.error)

            let options = question.options.map { $0.option }
            guard let correctOptionIndex = options.firstIndex(of: question.asnwer.option) else { return }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.question.options[correctOptionIndex].isMathed = .matched
                self.generator.notificationOccurred(.success)
            }
        }

        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            if QuizManager.currentIndex >= QuizManager.questions.count {
                self.quizCompleted = true
            } else {
                self.question = QuizManager.getQuestion()
            }
        }
    }

    func restartQuiz() {
        quizCompleted = false
        successGuesses = 0
        QuizManager.currentIndex = 0
        QuizManager.questions.shuffle()
        question = QuizManager.getQuestion()
    }

    func resetQuiz() {
        quizCompleted = false
        successGuesses = 0
        QuizManager.currentIndex = 0
        QuizManager.questions.shuffle()
    }
}


extension QuizManager {
    
    static var questions: [Question] = QuizManager.prepareQuestions()

    static func getQuestion() -> Question {
        let question = QuizManager.questions[currentIndex]
        QuizManager.currentIndex += 1
        return question
    }

    static func prepareQuestions() -> [Question] {
        return Letter.alphabet.shuffled().map { letter in
            let options = QuizManager.prepareOptions(letter: letter)
            return QuizManager.prepareQuestion(letter: letter, options: options)
        }
    }

    static func prepareOptions(letter: Letter) -> [Option] {
        let filteredLetters = Letter.alphabet.filter { $0 != letter }
        var letters = filteredLetters.randomSample(count: 3)
        letters.append(letter)
        return letters.map { Option(option: $0.georgianLetter) }
    }

    static func prepareQuestion(letter: Letter, options: [Option]) -> Question {
        return Question(
            title: letter.latinLetter,
            asnwer: Option(option: letter.georgianLetter),
            options: options.shuffled(),
            pronounciation: letter.pronounciation
        )
    }
}
