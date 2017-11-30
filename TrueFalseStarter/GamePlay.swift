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

let questionsPerRound = 10
var questionsAsked = 0
var correctQuestions = 0
var indexOfSelectedQuestion: Int = 0
var counter = 0
var reload = true

let lightingModeTimeout = 15.0
var lightingModeTrigger: Bool = false
var lightningTimer: Timer?
    
let triviaProvider = TriviaProvider()
let gameSounds = GameSounds()

var buttonsHandler: ButtonsHandler?
var labelsHandler: LabelsHandler?

    init? (questionField: UILabel,
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
        gameSounds.loadGameStartSound()
        gameSounds.loadCorrectAnswerSound()
        gameSounds.loadWrongAnswerSound()
    }

    func gameStart() {
        gameSounds.playGameStartSound()
        resetOptionButtons()
        option3Button.isHidden = true
        option4Button.isHidden = true
        controlButton.isHidden = true
        answerField.isHidden = true
        questionField.isHidden = false
        questionField.text = "Please select a game mode!\n Lighing mode leaves you only 15 seconds to answer a question."
        option1Button.isHidden = false
        option1Button.setTitle(styleProvider.REGULAR_MODE_CAPTION, for: .normal)
        option2Button.isHidden = false
        option2Button.setTitle(styleProvider.LIGHTING_MODE_CAPTION, for: .normal)
        
        //displayQuestion()
    }
    
    func displayQuestion() {
        questionsAsked += 1
        questionDictionary = triviaProvider.provide()
        var allOptions: [String] = [questionDictionary.answer]
        allOptions += questionDictionary.otherOptions
        option1Button.isHidden = false
        option2Button.isHidden = false
        option3Button.isHidden = false
        option4Button.isHidden = false
        setButtons(option1Button,
                   option2Button,
                   option3Button,
                   option4Button,
                   controlButton,
                   allOptions)
        answerField.isHidden = true
        questionField.text = questionDictionary.question
        controlButton.isHidden = true
        if lightingModeTrigger == true {
        lightningTimer = Timer.scheduledTimer(timeInterval: lightingModeTimeout, target: self, selector: #selector(controlButtonPressed), userInfo: nil, repeats: false)
        }
    }
    
    
    func displayScore() {
        // Hide the answer buttons
        answerField.isHidden = true
        option1Button.isHidden = true
        option2Button.isHidden = true
        option3Button.isHidden = true
        option4Button.isHidden = true
        
        // Display control button
        controlButton.isHidden = false
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
        controlButton.setTitle("Play Again!", for: .normal)
    }
    
    @objc func controlButtonPressed(){
        if questionsAsked == questionsPerRound {
            // Game is over
            displayScore()
            questionsAsked = 0
            correctQuestions = 0
        } else if (questionsAsked == 0) {
            gameStart()
        } else {
            // Continue game
            nextRound()
        }
    }
    
    func checkAnswer(_ sender: UIButton) {
        if lightingModeTrigger == true {
            lightningTimer?.invalidate()
        }
        fadeOptionButtons() // Fading option buttons
        let correctAnswer = questionDictionary.answer
        if (sender === option1Button && correctAnswer == option1Button.title(for: .normal)) ||
            (sender === option2Button && correctAnswer == option2Button.title(for: .normal)) ||
            (sender === option3Button && correctAnswer == option3Button.title(for: .normal)) ||
            (sender === option4Button && correctAnswer == option4Button.title(for: .normal)){
            correctQuestions += 1
            gameSounds.playCorrectAnswerSound()
            highlight(sender: sender, button: sender, questionField, answerField)
            controlButtonCaptionSetter()
            disableOptionButtons()
        } else if
            (sender.title(for: .normal) == styleProvider.REGULAR_MODE_CAPTION){
            lightingModeTrigger = false
            nextRound()
        } else if
            (sender.title(for: .normal) == styleProvider.LIGHTING_MODE_CAPTION){
            lightingModeTrigger = true
            nextRound()
        }
        else if
            (correctAnswer == option1Button.title(for: .normal)){
            gameSounds.playWrongAnswerSound()
            disableOptionButtons()
            controlButtonCaptionSetter()
            highlight(sender: sender, button: option1Button, questionField, answerField)
        } else if
            (correctAnswer == option2Button.title(for: .normal)){
            gameSounds.playWrongAnswerSound()
            disableOptionButtons()
            controlButtonCaptionSetter()
            highlight(sender: sender, button: option2Button, questionField, answerField)
        } else if
            (correctAnswer == option3Button.title(for: .normal)){
            gameSounds.playWrongAnswerSound()
            disableOptionButtons()
            controlButtonCaptionSetter()
            highlight(sender: sender, button: option3Button, questionField, answerField)
        } else if
            (correctAnswer == option4Button.title(for: .normal)){
            gameSounds.playWrongAnswerSound()
            disableOptionButtons()
            controlButtonCaptionSetter()
            highlight(sender: sender, button: option4Button, questionField, answerField)
        }
    }
    
    
    func nextRound() {
    self.answerField.isHidden = true
    resetOptionButtons()
    self.questionField.font = self.self.styleProvider.LABEL_REGULAR
    self.questionField.textColor = self.self.styleProvider.WHITE
    
    displayQuestion()

    }
    
    func highlight(sender: UIButton, button: UIButton, _ questionField: UILabel, _ answerField: UILabel) {
        if sender.title(for: .normal) != button.title(for: .normal) {
            answerField.isHidden = false
            answerField.text = "Sorry, that's a wrong one!"
            answerField.textColor = styleProvider.ORANGE
            button.titleLabel?.font = styleProvider.BUTTON_BOLD
            button.backgroundColor = styleProvider.GREEN_DISABLED
            sender.backgroundColor = styleProvider.RED
            sender.setTitleColor(styleProvider.WHITE, for: .disabled)
        } else {
            answerField.isHidden = false
            answerField.text = "Correct!"
            answerField.font = styleProvider.LABEL_BOLD
            answerField.textColor = styleProvider.GREEN
            button.setTitleColor(styleProvider.WHITE, for: .disabled)
            button.titleLabel?.font = styleProvider.BUTTON_BOLD
            button.backgroundColor = styleProvider.GREEN
        }
    }

    
    func setButtons (_ option1Button: UIButton,
                     _ option2Button: UIButton,
                     _ option3Button: UIButton,
                     _ option4Button: UIButton,
                     _ playAgainButton: UIButton,
                     _ passedOptions: [String]) {
        var allOptions = passedOptions
        switch allOptions.count {
        case 4:
            option1Button.setTitle(allOptions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: allOptions.count)), for: .normal)
            option2Button.setTitle(allOptions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: allOptions.count)), for: .normal)
            option3Button.setTitle(allOptions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: allOptions.count)), for: .normal)
            option4Button.setTitle(allOptions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: allOptions.count)), for: .normal)
        case 3:
            option1Button.setTitle(allOptions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: allOptions.count)), for: .normal)
            option2Button.setTitle(allOptions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: allOptions.count)), for: .normal)
            option3Button.setTitle(allOptions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: allOptions.count)), for: .normal)
            option4Button.isHidden = true
        case 2:
            option1Button.setTitle(allOptions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: allOptions.count)), for: .normal)
            option2Button.setTitle(allOptions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: allOptions.count)), for: .normal)
            option3Button.isHidden = true
            option4Button.isHidden = true
        default:
            option1Button.setTitle(questionDictionary.answer, for: .normal)
            option2Button.isHidden = true
            option3Button.isHidden = true
            option4Button.isHidden = true
        }
    }
    

    
    func controlButtonCaptionSetter() {
        if questionsAsked == questionsPerRound {
            controlButton.setTitle("Check my score", for: .normal)
        } else {
            controlButton.setTitle("Next question", for: .normal)
        }
        controlButton.isHidden = false
    }
    

    
}
