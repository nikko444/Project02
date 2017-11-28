//
//  ButtonColorProvider.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-27.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import UIKit
//import GameKit

struct StyleProvider {
    let colors = [
        "WHITE": UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 1.0), //white color
        "WHITE_DISABLED": UIColor(red: 255/255.0, green: 255/255.0, blue: 255/255.0, alpha: 0.5), //white color
        "TEAL": UIColor(red: 90/255.0, green: 187/255.0, blue: 181/255.0, alpha: 1.0), //teal color
        "YELLOW": UIColor(red: 222/255.0, green: 171/255.0, blue: 66/255.0, alpha: 1.0), //yellow color
        "RED": UIColor(red: 255/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0), //red color
        "ORANGE": UIColor(red: 239/255.0, green: 130/255.0, blue: 100/255.0, alpha: 1.0), //orange color
        "DARK": UIColor(red: 77/255.0, green: 75/255.0, blue: 82/255.0, alpha: 1.0), //dark color
        "PURPLE": UIColor(red: 105/255.0, green: 94/255.0, blue: 133/255.0, alpha: 1.0), //purple color
        "GREEN": UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 1.0), //green color
        "GREEN_DISABLED": UIColor(red: 85/255.0, green: 176/255.0, blue: 112/255.0, alpha: 0.7), //green color
        "PALE_GREEN": UIColor(red: 11/255.0, green: 121/255.0, blue: 150/255.0, alpha: 1.0), //pale green
        "PALE_GREEN_DISABLED": UIColor(red: 11/255.0, green: 121/255.0, blue: 150/255.0, alpha: 0.2) //pale green
    ]
    
    let fonts = [
        "LABEL_REGULAR": UIFont(name:"HelveticaNeue-Bold", size: 17.0),
        "LABEL_BOLD": UIFont(name:"HelveticaNeue-Bold", size: 19.0),
        "BUTTON_REGULAR": UIFont(name:"HelveticaNeue", size: 16.0),
        "BUTTON_BOLD": UIFont(name:"HelveticaNeue-Bold", size: 17.0)
    ]
    
    
    func provideColor (_ color: String) -> UIColor {
        return colors[color]!
    }
    
    func provideFont (_ font: String) -> UIFont {
        return fonts[font]!!
    }
    
    
  //  func randomColor() -> UIColor {
  //      let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: colors.count)
  //      return colors[randomNumber]
  //  }
    
}
