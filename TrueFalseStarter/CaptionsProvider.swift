//
//  ControlCaptionsProvider.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-30.
//  Copyright © 2017 Treehouse. All rights reserved.
//

enum Captions: String {
    case controlButtonCheckScore = "Check my score!"
    case controlButtonNextQuestion = "Next Question"
    case controlButtonPlayAgain = "Play Again!"
    
    case startMenuRegularMode = "Regular Mode 🐢"
    case startMenuLightingMode = "Lighting Mode ⚡️"
    case startMenuLabel = "Please select the game mode"
    
    case answerLabelCorrect = "Correct!"
    case answerLabelWrong = "Oops, that was a wrong one!"
}

enum Score {
    case show(correct: Int, of: Int)
    
    func provide() -> String{
        switch self {
        case .show(let correct, let of): return "Way to go!\nYou got \(correct) out of \(of) correct!"
        }
    }
}

