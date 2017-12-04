//
//  ControlCaptionsProvider.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-30.
//  Copyright © 2017 Treehouse. All rights reserved.
//

enum ControlButtonCaptions: String {
        case checkScore = "Check my score!"
        case nextQuestion = "Next Question"
        case playAgain = "Play Again!"
    }

enum StartMenuButtonsCaptions: String {
        case regularMode = "Regular Mode 🐢"
        case lightingMode = "Lighting Mode ⚡️"
    }

enum StartMenuLabelsCaptions: String {
         case startMenuLabel = "Please select the game mode"
    }

enum AnswerLabelCaptions: String {
        case correct = "Correct!"
        case wrong = "Oops, that was a wrong one!"
        case timeout = "Sorry! Time is out!"
    }

enum Score {
    case show(correct: Int, of: Int)
    
    func provide() -> String{
        switch self {
        case .show(let correct, let of): return "Way to go!\nYou got \(correct) out of \(of) correct!"
        }
    }
}

