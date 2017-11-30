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
        guard let assignableQuestionField = questionField, let assignableAnswerField = answerField else {
            return nil
        }
        self.questionField = assignableQuestionField
        self.answerField = assignableAnswerField
    }
}
