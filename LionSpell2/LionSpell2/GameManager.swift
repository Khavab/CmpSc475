//
//  GameManager.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import Foundation

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
        
        currentWord = ""
    }
    
    func deleteWord() {
        currentWord = String(currentWord.dropLast())
    }
    
    func addLetter(char: String) {
        isValid =  Words.words.contains(currentWord.lowercased()) && !foundWords.contains(currentWord.lowercased())
        currentWord = currentWord + char
    }
    
    private func updateIsValid() {
            isValid = Words.words.contains(currentWord.lowercased()) && !foundWords.contains(currentWord.lowercased())
    }
    
    func showHint() {
        
    }
    
    func newGame() {
        score = 0
        foundWords = []
        currentWord = ""
        isValid = false
        newLetters()
    }
    
    private func newLetters() {
        letters.removeAll()
        let uniqueFiveLetterWords = Words.words.filter {
            $0.count == 5 && Set($0).count == 5
        }
        let selectedWord = uniqueFiveLetterWords.randomElement() ?? "error"
        let selectedLetters = Array(selectedWord.uppercased())


        for char in selectedLetters {
            if let spellLetter = spellLetters.first(where: { $0.letter == String(char) }) {
                letters.append(spellLetter)
            }
        }
        
        shuffleLetters()
    }

    func shuffleLetters() {
        letters.shuffle()
    }


}

struct SpellLetter: Identifiable {
    let letter: String
    let id = UUID()
}
