//
//  TriviaQuestionService.swift
//  Trivia
//
//  Created by Yujing Wei on 3/26/25.
//

import Foundation

class TriviaQuestionService {
    private let urlString = "https://opentdb.com/api.php?amount=5"
    
    func fetchTriviaQuestions(completion: @escaping ([TriviaQuestion]?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let result = try decoder.decode(TriviaResponse.self, from: data)
                let questions = result.results.map { triviaItem in
                    TriviaQuestion(
                        category: triviaItem.category,
                        question: triviaItem.question,
                        correctAnswer: triviaItem.correctAnswer,
                        incorrectAnswers: triviaItem.incorrectAnswers,
                        type: triviaItem.type // Include the type field here
                    )
                }
                completion(questions)
            } catch {
                completion(nil)
            }
        }
        task.resume()
    }
}

// Model to match API response
struct TriviaResponse: Codable {
    let results: [TriviaQuestion]
}
