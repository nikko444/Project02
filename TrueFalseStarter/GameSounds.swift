//
//  GameSounds.swift
//  TrueFalseStarter
//
//  Created by nikko444 on 2017-11-27.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import AudioToolbox

class GameSounds {
 
var gameStartSound: SystemSoundID = 0
var correctAnswerSound: SystemSoundID = 0
var wrongAnswerSound: SystemSoundID = 0
    
func loadGameStartSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameStartSound)
    }

func loadCorrectAnswerSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "CorrectAnswer", ofType: "mp3")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &correctAnswerSound)
    }
    
func loadWrongAnswerSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "WrongAnswer", ofType: "mp3")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &wrongAnswerSound)
    }
    
    
func playGameStartSound() {
    AudioServicesPlaySystemSound(gameStartSound)
    }

func playCorrectAnswerSound() {
        AudioServicesPlaySystemSound(correctAnswerSound)
    }

func playWrongAnswerSound() {
        AudioServicesPlaySystemSound(wrongAnswerSound)
    }
    
}
