//
//  GameController.swift
//  Trivia
//
//  Created by Yujing Wei on 3/12/25.
//

import UIKit

class GameController: UIViewController {
    private var questions = [Question]()
    private var currentScore = 0
    private var currentQuestionIndex = 0
    private var isGameOver = false
    
    @IBOutlet weak var questionNumber: UILabel!
    @IBOutlet weak var questionCategory: UILabel!
    @IBOutlet weak var questionDescription: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBAction func answer1(_ sender: UIButton) {
        if currentQuestionIndex == questions.count - 1 {
            isGameOver = true
        }
        if sender.currentTitle == questions[currentQuestionIndex].correctAnswer {
            currentScore += 1
        }
        currentQuestionIndex = min(currentQuestionIndex + 1, questions.count - 1)
        configure(with: questions[currentQuestionIndex])
    }
    @IBAction func answer2(_ sender: UIButton) {
        if currentQuestionIndex == questions.count - 1 {
            isGameOver = true
        }
        if sender.currentTitle == questions[currentQuestionIndex].correctAnswer {
            currentScore += 1
        }
        currentQuestionIndex = min(currentQuestionIndex + 1, questions.count - 1)
        configure(with: questions[currentQuestionIndex])
    }
    
    @IBAction func answer3(_ sender: UIButton) {
        if currentQuestionIndex == questions.count - 1 {
            isGameOver = true
        }
        if sender.currentTitle == questions[currentQuestionIndex].correctAnswer {
            currentScore += 1
        }
        currentQuestionIndex = min(currentQuestionIndex + 1, questions.count - 1)
        configure(with: questions[currentQuestionIndex])
    }
    
    @IBAction func answer4(_ sender: UIButton) {
        if currentQuestionIndex == questions.count - 1 {
            isGameOver = true
        }
        if sender.currentTitle == questions[currentQuestionIndex].correctAnswer {
            currentScore += 1
        }
        currentQuestionIndex = min(currentQuestionIndex + 1, questions.count - 1)
        configure(with: questions[currentQuestionIndex])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = createMockData()
        configure(with: questions[currentQuestionIndex])
        
    }
    
    private func configure(with question: Question) {
        if isGameOver {
            let alert = UIAlertController(title: "Game Over", message:"Total scores: \(currentScore)/\(questions.count)", preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: { _ in
                self.currentScore = 0
                self.currentQuestionIndex = 0
                self.isGameOver = false
                self.configure(with: self.questions[self.currentQuestionIndex])
            }))
            self.present(alert, animated: true, completion: nil)
            return  // Exit early, since there's no question to load after game over
        }
        questionNumber.text = "Questions: \(currentQuestionIndex + 1)/\(questions.count)"
        questionCategory.text = question.category
        questionDescription.text = question.description
        answer1.setTitle(question.multipleChoice[0], for: .normal)
        answer2.setTitle(question.multipleChoice[1], for: .normal)
        answer3.setTitle(question.multipleChoice[2], for: .normal)
        answer4.setTitle(question.multipleChoice[3], for: .normal)
    }
}

private func createMockData() -> [Question] {
    let mockData1 = Question.art
    let mockData2 = Question.math
    let mockData3 = Question.history
    let mockData4 = Question.music
    return [mockData1, mockData2, mockData3, mockData4]
}
