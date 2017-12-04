//
//  GamePlay.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-25.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import GameKit

class GamePlay {

let questionsPerRound = 10                      //Game parameters
var questionsAsked = 0
var correctQuestions = 0

let lightingModeTimeout = 15.0                  //Timer parameters
var lightingModeTrigger: Bool = false
var lightningTimer: Timer?
    
let triviaProvider = TriviaProvider()
let gameSounds = GameSounds()

var question: TriviaModel?
var buttonsHandler: ButtonsHandler?
var labelsHandler: LabelsHandler?

    init (questionField: UILabel,
          answerField: UILabel,
          option1Button: UIButton,
          option2Button: UIButton,
          option3Button: UIButton,
          option4Button: UIButton,
          controlButton: UIButton){
        labelsHandler = LabelsHandler(questionField: questionField,
                                      answerField: answerField)
        buttonsHandler = ButtonsHandler(option1Button: option1Button,
                                        option2Button: option2Button,
                                        option3Button: option3Button,
                                        option4Button: option4Button,
                                        controlButton: controlButton)
    }

    func gameStart () {
        questionsAsked = 0
        correctQuestions = 0
        gameSounds.playGameStartSound()
        buttonsHandler?.setStartMenu()
        labelsHandler?.setStartMenu()
    }
    
    @objc func showTimeout () {
        gameSounds.playTimeoutSound()
        labelsHandler?.setAnswerCaptions(isCorrect: .timeout)
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(displayQuestion), userInfo: nil, repeats: false)
    }
    
    @objc func displayQuestion () throws {
        questionsAsked += 1
        
        if questionsAsked == questionsPerRound {
            displayScore()
        } else {
            question = triviaProvider.provide()
            guard let unwrappedQuestion = question,
                let unwrappedButtonHandler = buttonsHandler,
                let unwrappedLabelsHandler = labelsHandler else {
                    throw FunctionErrors.gamePlayDisplayQuestion
            }
            do {
                try unwrappedButtonHandler.setFourOptions(for: unwrappedQuestion)
            } catch FunctionErrors.buttonsHandlerSetOptions {
                unwrappedButtonHandler.setThreeOptions(for: unwrappedQuestion)
            }
            unwrappedLabelsHandler.setQuestionCaptions(for: unwrappedQuestion)
            if lightingModeTrigger == true {
                lightningTimer = Timer.scheduledTimer(timeInterval: lightingModeTimeout, target: self, selector: #selector(showTimeout), userInfo: nil, repeats: false)
            }
        }
    }
    
    func displayScore () {
        buttonsHandler?.hideAllButtons()
        buttonsHandler?.setControlButton(for: .playAgain)
        labelsHandler?.setScoreCaptions(correct: correctQuestions, of: questionsAsked)
    }
    
    func controlButtonPressed (_ sender: UIButton) throws {
        guard let title = sender.title(for: .normal) else {
            throw FunctionErrors.gamePlayControlButtonPressed
        }
        switch title {
            case ControlButtonCaptions.nextQuestion.rawValue: try displayQuestion()
            case ControlButtonCaptions.checkScore.rawValue:
                buttonsHandler?.hideAllButtons()
                displayScore()
            case ControlButtonCaptions.playAgain.rawValue: gameStart()
            default: throw FunctionErrors.gamePlayControlButtonPressed
        }
    }
    
    func optionButtonPressed (_ sender: UIButton) throws {
        if lightingModeTrigger == true {
            lightningTimer?.invalidate()
        }
        buttonsHandler?.disableOptionButtons() 
        if labelsHandler?.questionField.text != StartMenuLabelsCaptions.startMenuLabel.rawValue { //Checking if in start menu
            guard let unwrappedQuestion = question,
                let title = sender.title(for: .normal) else {
                    throw FunctionErrors.gamePlayOptionButtonPressed
            }
            switch title {
                case unwrappedQuestion.answer: // Correct answer
                    self.correctQuestions += 1
                    self.gameSounds.playCorrectAnswerSound()
                    self.labelsHandler?.setAnswerCaptions(isCorrect: .correct)
                    try self.buttonsHandler?.showCheckedAnswer(question: unwrappedQuestion,
                                                               sender: sender,
                                                               questionsAsked: self.questionsAsked,
                                                               questionsPerRound: self.questionsPerRound)
                default: //Wrong answer
                    self.gameSounds.playWrongAnswerSound()
                    self.labelsHandler?.setAnswerCaptions(isCorrect: .wrong)
                    try self.buttonsHandler?.showCheckedAnswer(question: unwrappedQuestion,
                                                               sender: sender,
                                                               questionsAsked: self.questionsAsked,
                                                               questionsPerRound: self.questionsPerRound)
                }
        } else {  // If we are in start menu  vvvvvvvvvvvvvvvvvvvvvvvv
            guard let title = sender.title(for: .normal) else {
                throw FunctionErrors.gamePlayOptionButtonPressed
            }
            switch title {
            case StartMenuButtonsCaptions.lightingMode.rawValue: // Lighting Mode
                self.lightingModeTrigger = true
                try self.displayQuestion()
            default:
                self.lightingModeTrigger = false //Regular Mode
                try self.displayQuestion()
            }
        }
    }  
}

