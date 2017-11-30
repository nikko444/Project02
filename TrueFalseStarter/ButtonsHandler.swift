//
//  ButtonsHandler.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-29.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

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
        guard let assignableOption1Button = option1Button,
            let assignableOption2Button = option2Button,
            let assignableOption3Button = option3Button,
            let assignableOption4Button = option4Button,
            let assignableControlButton = controlButton
            else {
                return nil
        }
        self.option1Button = assignableOption1Button
        self.option2Button = assignableOption2Button
        self.option3Button = assignableOption3Button
        self.option4Button = assignableOption4Button
        self.controlButton = assignableControlButton
        setRoundCorners()
    }
    
    func setRoundCorners() {
        option1Button.layer.cornerRadius = 10
        option2Button.layer.cornerRadius = 10
        option3Button.layer.cornerRadius = 10
        option4Button.layer.cornerRadius = 10
        controlButton.layer.cornerRadius = 10
    }
    
    func resetOptionButtons() {
        option1Button.backgroundColor = Colors.paleGreen.provide()
        option1Button.titleLabel?.font = Fonts.buttonRegular.provide()
        option1Button.setTitleColor(Colors.white_disabled.provide(), for: .disabled)
        option1Button.setTitleColor(Colors.white.provide(), for: .normal)
        option1Button.isEnabled = true
        
        option2Button.backgroundColor = Colors.paleGreen.provide()
        option2Button.titleLabel?.font = Fonts.buttonRegular.provide()
        option2Button.setTitleColor(Colors.white_disabled.provide(), for: .disabled)
        option2Button.setTitleColor(Colors.white.provide(), for: .normal)
        option2Button.isEnabled = true

        option3Button.backgroundColor = Colors.paleGreen.provide()
        option3Button.titleLabel?.font = Fonts.buttonRegular.provide()
        option3Button.setTitleColor(Colors.white_disabled.provide(), for: .disabled)
        option3Button.setTitleColor(Colors.white.provide(), for: .normal)
        option3Button.isEnabled = true
        
        option4Button.backgroundColor = Colors.paleGreen.provide()
        option4Button.titleLabel?.font = Fonts.buttonRegular.provide()
        option4Button.setTitleColor(Colors.white_disabled.provide(), for: .disabled)
        option4Button.setTitleColor(Colors.white.provide(), for: .normal)
        option4Button.isEnabled = true
    }
    
    func disableOptionButtons() {
        option1Button.isEnabled = false
        option2Button.isEnabled = false
        option3Button.isEnabled = false
        option4Button.isEnabled = false
    }
    
    func fadeOptionButtons() {
        option1Button.backgroundColor = Colors.paleGreenDisabled.provide()
        option2Button.backgroundColor = Colors.paleGreenDisabled.provide()
        option3Button.backgroundColor = Colors.paleGreenDisabled.provide()
        option4Button.backgroundColor = Colors.paleGreenDisabled.provide()
    }
    
}
