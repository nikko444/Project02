//
//  GamePlay.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-25.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class GamePlay {

let questionsPerRound = 4
var questionsAsked = 0
var correctQuestions = 0
var indexOfSelectedQuestion: Int = 0
var questionDictionary: [String: String] = [:]

var gameSound: SystemSoundID = 0

let triviaProvider = TriviaProvider()

var questionField: UILabel!
var trueButton: UIButton!
var falseButton: UIButton!
var playAgainButton: UIButton!

    init (){
        questionField = UILabel()
        trueButton = UIButton()
        falseButton = UIButton()
        playAgainButton = UIButton()
    }

    init (questionField: UILabel,
          trueButton: UIButton,
          falseButton: UIButton,
          playAgainButton: UIButton){
        self.questionField = questionField
        self.trueButton = trueButton
        self.falseButton = falseButton
        self.playAgainButton = playAgainButton
    }
    
    func displayQuestion() {
        questionDictionary = triviaProvider.provide()
        questionField.text = questionDictionary["Question"]
        playAgainButton.isHidden = true
    }
    
    func displayScore() {
        // Hide the answer buttons
        trueButton.isHidden = true
        falseButton.isHidden = true
        
        // Display play again button
        playAgainButton.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
    }
    
    func checkAnswer(_ sender: UIButton) {
    // Increment the questions asked counter
    questionsAsked += 1
    
    let correctAnswer = questionDictionary["Answer"]
    
    if (sender === trueButton &&  correctAnswer == "True") || (sender === falseButton && correctAnswer == "False") {
    correctQuestions += 1
    questionField.text = "Correct!"
    } else {
    questionField.text = "Sorry, wrong answer!"
    }
    
    loadNextRoundWithDelay(seconds: 2)
    }
    
    
    func nextRound() {
    if questionsAsked == questionsPerRound {
    // Game is over
    displayScore()
    } else {
    // Continue game
    displayQuestion()
    }
    }
    
    func playAgain() {
        // Show the answer buttons
        trueButton.isHidden = false
        falseButton.isHidden = false
        questionsAsked = 0
        correctQuestions = 0
        nextRound()
    }
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
    
}
