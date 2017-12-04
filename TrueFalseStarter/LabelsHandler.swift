//
//  FieldsHandler.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-29.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

struct LabelsHandler {
    var questionField: UILabel
    var answerField: UILabel
    
    init? (questionField: UILabel?,
           answerField: UILabel?) {
        guard let unwrappedQuestionField = questionField, let unwrappedAnswerField = answerField else {
            return nil
        }
        self.questionField = unwrappedQuestionField
        self.answerField = unwrappedAnswerField
    }
    
    func setStartMenu () {
        resetAllLabels()
        questionField.text = StartMenuLabelsCaptions.startMenuLabel.rawValue
        questionField.isHidden = false
    }
    
    func setQuestionCaptions (for trivia: TriviaModel) {
        resetAllLabels()
        self.questionField.text = trivia.question
        self.questionField.isHidden = false
    }
    
    func resetAllLabels () {
        self.questionField.isHidden = true
        self.answerField.isHidden = true
        questionField.font = Fonts.labelRegular.provide()
        questionField.textColor = Colors.white.provide()
        answerField.font = Fonts.labelRegular.provide()
        answerField.textColor = Colors.white.provide()
    }
    
    func setAnswerCaptions (isCorrect: AnswerLabelCaptions) {
        switch isCorrect {
            case .correct:
                answerField.textColor = Colors.green.provide()
                answerField.text = isCorrect.rawValue
                answerField.isHidden = false
            case .wrong:
                answerField.textColor = Colors.orange.provide()
                answerField.text = isCorrect.rawValue
                answerField.isHidden = false
            case .timeout:
                answerField.textColor = Colors.red.provide()
                answerField.text = isCorrect.rawValue
                answerField.isHidden = false
        }
    }
    
    func setScoreCaptions (correct: Int, of: Int) {
        resetAllLabels()
        self.questionField.text = Score.show(correct: correct, of: of).provide()
        self.questionField.isHidden = false
    }
}
