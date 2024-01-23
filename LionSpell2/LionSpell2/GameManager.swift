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
    @Published var foundWords: [String] = [] {
            didSet {
                updateIsValid()
            }
        }
    @Published var currentWord: String = "" {
            didSet {
                updateIsValid()
            }
        }
    
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
    
    @Published var isValid: Bool = false
    
            
    init(size: Int) {
        newGame()
    }

    func submitWord() {
        foundWords.append(currentWord.lowercased())
        if currentWord.count == 4 {
            score += 1
        }
        else {
            score += currentWord.count
        }
        
        let currentWordLetters = Set(currentWord.lowercased())
        let allLettersUsed = letters.allSatisfy { letter in
            currentWordLetters.contains(letter.letter.lowercased())
        }

        if allLettersUsed {
            score += 10
        }
    }
    
    func deleteWord() {
        currentWord = String(currentWord.dropLast())
    }
    
    func addLetter(char: String) {
        isValid =  Words.words.contains(currentWord.lowercased()) && !foundWords.contains(currentWord.lowercased())
        currentWord = currentWord + char
    }
    
    func updateIsValid() {
            isValid = Words.words.contains(currentWord.lowercased()) && !foundWords.contains(currentWord.lowercased())
    }
    
    func showHint() {
        
    }
    
    func newGame() {
        score = 0
        foundWords = []
        currentWord = ""
        letters = []
        isValid = false
        while letters.count < 5 {
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
