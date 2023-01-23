//
//  Quiz.swift
//  Aso
//
//  Created by Астемир Бозиев on 21.01.2023.
//

import Foundation
import SwiftUI

struct Quiz {
    var currentQuestionIndex: Int
    var quizModel: QuizModel
    var quizCompleted: Bool = false
    var quizWinningStatus: Bool = false
}

struct QuizModel {
    var question: String
    var answer: String
    var optionsList: [QuizOption]
}

struct QuizOption : Identifiable {
    var id: Int
    var option: String
    var isSelected: Bool = false
    var isMatched: Bool = false
}
