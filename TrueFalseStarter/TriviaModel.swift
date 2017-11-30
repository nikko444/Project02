//
//  TriviaModel.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-25.
//  Copyright © 2017 Treehouse. All rights reserved.
//

struct TriviaModel {
    let question: String
    let answer: String
    let option1: String
    let option2: String
    let option3: String?
    
    init? (question: String?, answer: String?, option1: String?, option2: String?) {
        guard let assignableQuestion = question,
            let assignableAnswer = answer,
            let assignableOption1 = option1,
            let assignableOption2 = option2
            else {
            return nil
        }
        self.question = assignableQuestion
        self.answer = assignableAnswer
        self.option1 = assignableOption1
        self.option2 = assignableOption2
        self.option3 = nil
    }
    
    init? (question: String?, answer: String?, option1: String?, option2: String?, option3: String?) {
        guard let assignableQuestion = question,
            let assignableAnswer = answer,
            let assignableOption1 = option1,
            let assignableOption2 = option2
            else {
                return nil
        }
        self.question = assignableQuestion
        self.answer = assignableAnswer
        self.option1 = assignableOption1
        self.option2 = assignableOption2
        self.option3 = option3
    }
}
