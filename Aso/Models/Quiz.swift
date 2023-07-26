//
//  Quiz.swift
//  Aso
//
//  Created by Астемир Бозиев on 21.01.2023.
//

import Foundation
import SwiftUI

struct Question {
    var title: String
    var asnwer: Option
    var options: [Option]
    var pronounciation: String

}

enum QuizResult {
    case matched, unmatched, none
}


struct Option: Identifiable, Equatable {
    let id: UUID = UUID()
    var isSelected: Bool = false
    var isMathed: QuizResult = .none
    let option: String
}
