//
//  Scramble.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import Foundation

struct Scramble {
    let letters: [SpellLetter]
    let words: [String]
    
    let spellLetters = [
        SpellLetter(letter: "A"), SpellLetter(letter: "B"), SpellLetter(letter: "C"),
        SpellLetter(letter: "D"), SpellLetter(letter: "E"), SpellLetter(letter: "F"),
        SpellLetter(letter: "G"), SpellLetter(letter: "H"), SpellLetter(letter: "I"),
        SpellLetter(letter: "J"), SpellLetter(letter: "K"), SpellLetter(letter: "L"),
        SpellLetter(letter: "M"), SpellLetter(letter: "N"), SpellLetter(letter: "O"),
        SpellLetter(letter: "P"), SpellLetter(letter: "Q"), SpellLetter(letter: "R"),
        SpellLetter(letter: "S"), SpellLetter(letter: "T"), SpellLetter(letter: "U"),
        SpellLetter(letter: "V"), SpellLetter(letter: "W"), SpellLetter(letter: "X"),
        SpellLetter(letter: "Y"), SpellLetter(letter: "Z")]
    
    init(size: Int, words: [String]){
        var temp: [SpellLetter] = []
        let uniqueFiveLetterWords = Words.words.filter {
            $0.count == 5 && Set($0).count == 5
        }
        let selectedWord = uniqueFiveLetterWords.randomElement() ?? "error"
        let selectedLetters = Array(selectedWord.uppercased())


        for char in selectedLetters {
            if let spellLetter = spellLetters.first(where: { $0.letter == String(char) }) {
                temp.append(spellLetter)
            }
        }
        
        self.letters = temp
        self.words = words
    }
    
    func isValid(currentWord: String, foundWords: [String]) -> Bool {
        return Words.words.contains(currentWord.lowercased()) && !foundWords.contains(currentWord.lowercased())
    }
    
    func wordScore(currentWord: String) -> Int {
        var score = 0
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
        
        return score
    }
}
