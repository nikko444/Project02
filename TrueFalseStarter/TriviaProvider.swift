//
//  TriviaProvider.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-25.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

class TriviaProvider {
    
    let trivia: [[String : String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]
    ]
    
    var usedQuestions: [Int] = []
    
    func randomQuestion () -> Int {
        if trivia.count == usedQuestions.count {
            usedQuestions = []
        }
        var indexOfSelectedQuestion: Int
        var reGenerate: Bool
        repeat {
            reGenerate = false
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
            for check in usedQuestions {
                if check == indexOfSelectedQuestion {
                    reGenerate = true
                }
            }
        } while reGenerate
        usedQuestions.append(indexOfSelectedQuestion)
        return indexOfSelectedQuestion
    }
    
    func provide () -> [String: String] {
        return trivia[randomQuestion()]
    }

}
