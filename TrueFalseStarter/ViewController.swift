//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    let triviaProvider = TriviaProvider()
    var gamePlay = GamePlay()
    
    @IBOutlet weak var questionField: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var playAgainButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        gamePlay = GamePlay(questionField: questionField, trueButton: trueButton, falseButton: falseButton, playAgainButton: playAgainButton)
        gamePlay.loadGameStartSound()
        // Start game
        gamePlay.playGameStartSound()
        gamePlay.displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        gamePlay.checkAnswer(sender)
    }

    @IBAction func playAgain() {
        gamePlay.playAgain()
    }

}
