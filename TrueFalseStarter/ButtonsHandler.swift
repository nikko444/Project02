//
//  ButtonsHandler.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-29.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
import GameKit

struct ButtonsHandler {
    let option1Button: UIButton
    let option2Button: UIButton
    let option3Button: UIButton
    let option4Button: UIButton
    let controlButton: UIButton
    
    init? (option1Button: UIButton?,
           option2Button: UIButton?,
           option3Button: UIButton?,
           option4Button: UIButton?,
           controlButton: UIButton?){
        guard let unwrappedOption1Button = option1Button,
            let unwrappedOption2Button = option2Button,
            let unwrappedOption3Button = option3Button,
            let unwrappedOption4Button = option4Button,
            let unwrappedControlButton = controlButton
            else {
                return nil
        }
        self.option1Button = unwrappedOption1Button
        self.option2Button = unwrappedOption2Button
        self.option3Button = unwrappedOption3Button
        self.option4Button = unwrappedOption4Button
        self.controlButton = unwrappedControlButton
        setRoundCorners() //SETTING ROUNDED CORNERS STYLE
    }
    
    func setStartMenu () {
        resetOptionButtons()
        controlButton.isHidden = true
        option1Button.setTitle(StartMenuButtonsCaptions.lightingMode.rawValue, for: .normal)
        option2Button.setTitle(StartMenuButtonsCaptions.regularMode.rawValue, for: .normal)
        option1Button.isEnabled = true
        option2Button.isEnabled = true
        option1Button.isHidden = false
        option2Button.isHidden = false
    }
    
    func setRoundCorners () { //SETS ROUNDED CORNERS STYLE
        option1Button.layer.cornerRadius = 10
        option2Button.layer.cornerRadius = 10
        option3Button.layer.cornerRadius = 10
        option4Button.layer.cornerRadius = 10
        controlButton.layer.cornerRadius = 10
    }
    
    func resetOptionButtons () {
        let optionButtons: [UIButton] = [self.option1Button,
                                         self.option2Button,
                                         self.option3Button,
                                         self.option4Button]
        for optionButton in optionButtons {
            optionButton.backgroundColor = Colors.paleGreen.provide()
            optionButton.titleLabel?.font = Fonts.buttonRegular.provide()
            optionButton.setTitleColor(Colors.white_disabled.provide(), for: .disabled)
            optionButton.setTitleColor(Colors.white.provide(), for: .normal)
            optionButton.isHidden = true
        }
    }
    
    func disableOptionButtons () {
        let optionButtons: [UIButton] = [self.option1Button,
                                         self.option2Button,
                                         self.option3Button,
                                         self.option4Button]
        for optionButton in optionButtons {
            optionButton.isEnabled = false
        }
    }
    
    func fadeOptionButtons () {
        self.option1Button.backgroundColor = Colors.paleGreenDisabled.provide()
        self.option2Button.backgroundColor = Colors.paleGreenDisabled.provide()
        self.option3Button.backgroundColor = Colors.paleGreenDisabled.provide()
        self.option4Button.backgroundColor = Colors.paleGreenDisabled.provide()
    }
    
    func setFourOptions (for trivia: TriviaModel) throws {
        guard let option3 = trivia.option3 else {
            throw FunctionErrors.buttonsHandlerSetOptions
        }
        hideAllButtons()
        resetOptionButtons()
        var captions: [String] = [trivia.answer, trivia.option1, trivia.option2, option3]
        let optionButtons: [UIButton] = [self.option1Button,
                                        self.option2Button,
                                        self.option3Button,
                                        self.option4Button]
        for optionButton in optionButtons {
            optionButton.setTitle(captions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: captions.count)), for: .normal)
            optionButton.isHidden = false
            optionButton.isEnabled = true
        }
    }
    
    func setThreeOptions (for trivia: TriviaModel) {
        hideAllButtons()
        resetOptionButtons()
        var captions: [String] = [trivia.answer, trivia.option1, trivia.option2]
        let optionButtons: [UIButton] = [self.option1Button,
                                         self.option2Button,
                                         self.option3Button]
        for optionButton in optionButtons {
            optionButton.setTitle(captions.remove(at: GKRandomSource.sharedRandom().nextInt(upperBound: captions.count)), for: .normal)
            optionButton.isHidden = false
            optionButton.isEnabled = true
        }
    }
    
    func hideAllButtons () {
        option1Button.isHidden = true
        option2Button.isHidden = true
        option3Button.isHidden = true
        option4Button.isHidden = true
        controlButton.isHidden = true
    }
    
    func setControlButton (for state: ControlButtonCaptions) {
        switch state {
        case .nextQuestion: controlButton.setTitle(state.rawValue, for: .normal)
        case .checkScore: controlButton.setTitle(state.rawValue, for: .normal)
        case .playAgain:
            controlButton.setTitle(state.rawValue, for: .normal)
        }
        controlButton.isHidden = false
    }
    
    func showCheckedAnswer (question: TriviaModel, sender: UIButton, questionsAsked: Int, questionsPerRound: Int) throws {
        guard let title = sender.title(for: .normal) else {
            throw FunctionErrors.buttonsHandlerShowCheckedAnswer
        }
        switch title {
            case question.answer:
                self.fadeOptionButtons()
                sender.titleLabel?.font = Fonts.buttonBold.provide()
                sender.setTitleColor(Colors.white.provide(), for: .disabled)
                sender.backgroundColor = Colors.green.provide()
            default:
                self.fadeOptionButtons()
                sender.titleLabel?.font = Fonts.buttonBold.provide()
                sender.backgroundColor = Colors.red.provide()
                sender.setTitleColor(Colors.white.provide(), for: .disabled)
                let optionButtons: [UIButton] = [self.option1Button,      // Highlighting the correct answer,
                                                 self.option2Button,      // by looping through all the control buttons
                                                 self.option3Button,      // and comparing its' captions to answer constant
                                                 self.option4Button]      // of TriviaModel Data type
                for optionButton in optionButtons {
                    if optionButton.titleLabel?.text == question.answer{
                        optionButton.setTitleColor(Colors.white.provide(), for: .disabled)
                        optionButton.backgroundColor = Colors.green.provide()
                    }
                }
        }
        if questionsAsked == questionsPerRound {
            setControlButton(for: ControlButtonCaptions.checkScore)
        } else {
            setControlButton(for: ControlButtonCaptions.nextQuestion)
        }
    }
}
