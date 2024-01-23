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
    private var seen: [String] = []
    private var size: Int = 0
    
    let spellLetters = [
        SpellLetter(letter: "A"), SpellLetter(letter: "B"), SpellLetter(letter: "C"),
        SpellLetter(letter: "D"), SpellLetter(letter: "E"), SpellLetter(letter: "F"),
        SpellLetter(letter: "G"), SpellLetter(letter: "H"), SpellLetter(letter: "I"),
        SpellLetter(letter: "J"), SpellLetter(letter: "K"), SpellLetter(letter: "L"),
        SpellLetter(letter: "M"), SpellLetter(letter: "N"), SpellLetter(letter: "O"),
        SpellLetter(letter: "P"), SpellLetter(letter: "Q"), SpellLetter(letter: "R"),
        SpellLetter(letter: "S"), SpellLetter(letter: "T"), SpellLetter(letter: "U"),
        SpellLetter(letter: "V"), SpellLetter(letter: "W"), SpellLetter(letter: "X"),
        SpellLetter(letter: "Y"), SpellLetter(letter: "Z")
    ]
    @Published var letters: [SpellLetter] = []
            
    init(size: Int) {
        newGame()
    }

    func submitWord() {
        if Words.words.contains(currentWord.lowercased()) && !seen.contains(currentWord.lowercased()) {
            score += currentWord.count
            seen.append(currentWord.lowercased())
        }
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
        score = 0
        foundWords = []
        currentWord = ""
        letters = []
        while letters.count < 10 {
            let newLetter = spellLetters[Int.random(in: 0..<spellLetters.count)]
            if !letters.contains(where: { $0.letter == newLetter.letter }) {
                letters.append(newLetter)
            }
        }
    }

    func shuffleLetters() {
        letters.shuffle()
    }


}

struct SpellLetter: Identifiable {
    let letter: String
    let id = UUID()
}
