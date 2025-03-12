//
//  TriviaGame.swift
//  Trivia
//
//  Created by Yujing Wei on 3/12/25.
//

import UIKit

//struct TriviaGame {
//    let question: Question
//}

enum Question: String {
    case art
    case music
    case math
    case history
    
    var category: String {
        switch self {
        case .art:
            return "Art"
        case .music:
            return "Music"
        case .math:
            return "Math"
        case .history:
            return "History"
        }
    }
        
    var description: String {
        switch self {
        case .art:
            return "Who is the famous Italian Renaissance artist?"
        case .music:
            return "Who is the greatest composer of all time?"
        case .math:
            return "In which year did the American Revolution take place?"
        case .history:
            return "Which of the following conflicts was fought between 1939 and 1945?"
        }
    }
    
    var multipleChoice: [String] {
        switch self {
        case .art:
            return ["Michelangelo", "Rembrandt", "Leonardo da Vinci", "Caravaggio"]
        case .music:
            return ["Johann Sebastian Bach", "Ludwig van Beethoven", "Wolfgang Amadeus Mozart", "Johannes Brahms"]
        case .math:
            return ["1752", "1776", "1812", "1867"]
        case .history:
            return ["The American Revolution", "The French Revolution", "The Industrial Revolution", "The Spanish Civil War"]
        }
    }
    
    var correctAnswer: String {
        switch self {
        case .art:
            return "Leonardo da Vinci"
        case .music:
            return "Ludwig van Beethoven"
        case .math:
            return "1776"
        case .history:
            return "The American Revolution"
        }
    }
}

