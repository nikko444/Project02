//
//  FontsProvider.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-30.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

enum Fonts {
    case labelRegular
    case labelBold
    case buttonRegular
    case buttonBold
    
    func provide () -> UIFont {
        switch self {
            
        case .labelRegular:
            guard let font = UIFont(name:"HelveticaNeue-Bold", size: 17.0) else {
                return UIFont()
            }
            return font
            
        case .labelBold:
            guard let font = UIFont(name:"HelveticaNeue-Bold", size: 19.0) else {
                return UIFont()
            }
            return font
            
        case .buttonRegular:
            guard let font = UIFont(name:"HelveticaNeue", size: 16.0) else {
                return UIFont()
            }
            return font
            
        case .buttonBold:
            guard let font = UIFont(name:"HelveticaNeue-Bold", size: 17.0) else {
                return UIFont()
            }
            return font
        }
    }
}
