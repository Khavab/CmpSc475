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
    let panagrams: [String]
    
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
    
    init(preferences: Preferences) {
        let size = preferences.difficulty.associatedInt
        let words = preferences.language.associatedLanguage

        var temp: [SpellLetter] = []
        let uniqueWords = words.filter { $0.count == size && Set($0).count == size }
        let selectedWord = uniqueWords.randomElement() ?? "error"
        let selectedLetters = Array(selectedWord.uppercased())

        for char in selectedLetters {
            if let spellLetter = spellLetters.first(where: { $0.letter == String(char) }) {
                temp.append(spellLetter)
            }
        }

        self.letters = temp

        let allowedCharacterSet = CharacterSet(charactersIn: Set(self.letters.map { $0.letter }).joined().lowercased())
        self.words = words.filter { word in
            let wordCharacterSet = CharacterSet(charactersIn: word)
            return allowedCharacterSet.isSuperset(of: wordCharacterSet)
        }

        self.panagrams = words.filter { word in
            let wordLettersSet = CharacterSet(charactersIn: word)
            return wordLettersSet == allowedCharacterSet
        }
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
        let allLettersUsed = self.letters.allSatisfy { letter in
            currentWordLetters.contains(letter.letter.lowercased())
        }

        if allLettersUsed {
            score += 10
        }
        
        return score
    }
}
