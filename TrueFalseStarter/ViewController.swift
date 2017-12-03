//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var gamePlay: GamePlay?
    
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
        if (gamePlay == nil) {
            questionField.text = "Unexpected error!!!\nSometing is wrong with Buttons and/or Lables Outlet referencing"
        }
        gamePlay!.gameStart()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        if (gamePlay == nil) {
            questionField.text = "Unexpected error!!!\nSometing is wrong with Options Buttons' actions bindings"
        }
        
        do {
        try gamePlay?.optionButtonPressed(sender)
        } catch FunctionErrors.gamePlayOptionButtonPressed {
            questionField.text = "Unexpected error!!!\nSometing is wrong with optionButtonPressed() Method of GamePlay class"
        } catch {
            questionField.text = "Unexpected error!!!\nUNKNOWN"
        }
    
    }

    @IBAction func controlButtonPressed(_ sender: UIButton) {
        if (gamePlay == nil) {
            questionField.text = "Unexpected error!!!\nSometing is wrong with Control Button's actions binding"
        }
        
        do {
            try gamePlay!.controlButtonPressed(sender)
        } catch FunctionErrors.gamePlayControlButtonPressed {
            questionField.text = "Unexpected error!!!\nSometing is wrong with controlButtonPressed() Method of GamePlay class"
        } catch {
            questionField.text = "Unexpected error!!!\nUNKNOWN"
        }
    }
    
}
