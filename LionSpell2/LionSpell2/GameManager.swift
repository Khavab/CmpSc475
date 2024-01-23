//
//  GameManager.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import Foundation
import SwiftUI

class GameViewModel: ObservableObject {
    @Published var score: Int = 0
    @Published var foundWords: [String] = []
    @Published var currentWord: String = ""
    let letters = ["A", "B", "C", "D", "E", "F", 
                   "G", "H", "I", "J", "K", "L", "M",
                   "N", "O", "P", "Q", "R", "S", "T",
                   "U", "V", "W", "X", "Y", "Z"]

    func submitWord() {

    }
    
    func deleteWord() {
        currentWord = ""
    }
    
    func addLetter(char: String) {
        currentWord = currentWord + char
    }
    
    func showHint() {
        
    }
    
    func newGame() {
        shuffleLetters()
        score = 0
        foundWords = []
        currentWord = ""
    }

    func shuffleLetters() {

    }
    

    
}
