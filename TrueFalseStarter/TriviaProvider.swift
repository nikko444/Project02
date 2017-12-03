//
//  TriviaProvider.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-25.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

class TriviaProvider {
   
    let trivia: [TriviaModel?] = [
        
        TriviaModel(question: "This was the only US President to serve more than two consecutive terms.",
                    answer: "Franklin D. Roosevelt",
                    option1: "George Washington",
                    option2: "Woodrow Wilson"),
        
        TriviaModel(question: "Which of the following countries has the most residents?",
                    answer: "Nigeria",
                    option1: "Russia",
                    option2: "Iran",
                    option3: "Vietnam"),
        
        TriviaModel(question: "In what year was the United Nations founded?",
                    answer: "1945",
                    option1: "1918",
                    option2: "1919",
                    option3: "1954"),
        
        TriviaModel(question: "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
                    answer: "New York City",
                    option1: "Washington D.C.",
                    option2: "Boston",
                    option3: "Paris"),
        
        TriviaModel(question: "Which nation produces the most oil?",
                    answer: "Canada",
                    option1: "Iran",
                    option2: "Iraq",
                    option3: "Brazil"),
        
        TriviaModel(question: "Which country has most recently won consecutive World Cups in Soccer?",
                    answer: "Brazil",
                    option1: "Italy",
                    option2: "Argetina",
                    option3: "Spain"),
        
        TriviaModel(question: "Which of the following rivers is longest?",
                    answer: "Mississippi",
                    option1: "Yangtze",
                    option2: "Congo",
                    option3: "Mekong"),
        
        TriviaModel(question: "Which city is the oldest?",
                    answer: "Mexico City",
                    option1: "Cape Town",
                    option2: "San Juan",
                    option3: "Sydney"),
        
        TriviaModel(question: "Which country was the first to allow women to vote in national elections?",
                    answer: "Poland",
                    option1: "United States",
                    option2: "Sweden",
                    option3: "Senegal"),
        
        TriviaModel(question: "Which of these countries won the most medals in the 2012 Summer Games?",
                    answer: "Great Britian",
                    option1: "France",
                    option2: "Germany",
                    option3: "Japan")
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
    
    func provide () -> TriviaModel? {
        guard let unwrappedTrivia = trivia[randomQuestion()] else {
            return nil
        }
        return unwrappedTrivia
    }

}
