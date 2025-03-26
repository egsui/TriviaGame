//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation

struct TriviaQuestion: Codable {
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]
    let type: String  // New field for question type
    
    enum CodingKeys: String, CodingKey {
        case category
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
        case type
    }
}
