//
//  TriviaProvider.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-25.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

class TriviaProvider {
   
    let trivia: [TriviaModel] = [
        TriviaModel(question: "This was the only US President to serve more than two consecutive terms.",
                    answer: "Franklin D. Roosevelt",
                    otherOptions: ["George Washington","Woodrow Wilson","Andrew Jackson"]),
        
        TriviaModel(question: "Which of the following countries has the most residents?",
                    answer: "Nigeria",
                    otherOptions: ["Russia","Iran","Vietnam"]),

        TriviaModel(question: "In what year was the United Nations founded?",
                    answer: "1945",
                    otherOptions: ["1918","1919","1954"]),
        
        TriviaModel(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
                    answer: "New York City",
                    otherOptions: ["Paris","Washington D.C.","Boston"]),
        
        TriviaModel(question: "Which nation produces the most oil?",
                    answer: "Canada",
                    otherOptions: ["Iran","Iraq","Brazil"]),
        
        TriviaModel(question: "Which country has most recently won consecutive World Cups in Soccer?",
                    answer: "Brazil",
                    otherOptions: ["Italy","Argetina","Spain"]),
        
        TriviaModel(question: "Which of the following rivers is longest?",
                    answer: "Mississippi",
                    otherOptions: ["Yangtze","Congo","Mekong"]),
        
        TriviaModel(question: "Which city is the oldest?",
                    answer: "Mexico City",
                    otherOptions: ["Cape Town","San Juan","Sydney"]),
        
        TriviaModel(question: "Which country was the first to allow women to vote in national elections?",
                    answer: "Poland",
                    otherOptions: ["United States","Sweden","Senegal"]),
        
        TriviaModel(question: "Which of these countries won the most medals in the 2012 Summer Games?",
                    answer: "Great Britian",
                    otherOptions: ["France","Germany","Japan"]),
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
    
    func provide () -> TriviaModel { //TODO have to modify this to comply with 4 button logic and hide buttons if there are less possible options then 4
        return trivia[randomQuestion()]
    }

}
