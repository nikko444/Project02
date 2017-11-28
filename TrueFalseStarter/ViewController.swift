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
    @IBOutlet weak var answerField: UILabel!
    @IBOutlet weak var option1Button: UIButton!
    @IBOutlet weak var option2Button: UIButton!
    @IBOutlet weak var option3Button: UIButton!
    @IBOutlet weak var option4Button: UIButton!
    @IBOutlet weak var controlButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gamePlay = GamePlay(questionField: questionField,
                            answerField: answerField,
                            option1Button: option1Button,
                            option2Button: option2Button,
                            option3Button: option3Button,
                            option4Button: option4Button,
                            controlButton: controlButton)
        gamePlay.gameStart()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        gamePlay.checkAnswer(sender)
    }

    @IBAction func controlButtonPressed() {
        gamePlay.controlButtonPressed()
    }
    
}
