//
//  ButtonColorProvider.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-27.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit

enum Colors {
    
    case white
    case white_disabled
    case orange
    case red
    case green
    case greenDisabled
    case paleGreen
    case paleGreenDisabled
    
    func provide () -> UIColor {
        switch self{
        case .white: return UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0)
        case .white_disabled: return UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.5)
        case .orange: return UIColor(red: 239/255.0, green: 130/255.0, blue: 100/255.0, alpha: 1.0)
        case .red: return UIColor(red: 255/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0)
        case .green: return UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 1.0)
        case .greenDisabled: return UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 0.7)
        case .paleGreen: return UIColor(red: 11/255.0, green: 121/255.0, blue: 150/255.0, alpha: 1.0)
        case .paleGreenDisabled: return UIColor(red: 11/255.0, green: 121/255.0, blue: 150/255.0, alpha: 0.2)
        }
    }
}
    

