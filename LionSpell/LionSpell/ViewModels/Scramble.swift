//
//  Scramble.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import Foundation

struct Scramble {
    let letters: [Character]
    let words: [String]
    let panagrams: [String]
    
    init(preferences: Preferences) {
        let size = preferences.difficulty.associatedInt
        let words = preferences.language.associatedLanguage
        
        let uniqueWords = words.filter { $0.count == size && Set($0).count == size }
        let selectedWord = uniqueWords.randomElement() ?? "error"
        let allowedCharacterSet = Set(selectedWord.uppercased())
        self.letters = Array(allowedCharacterSet)
        
        self.words = words.filter { word in
            let wordCharacterSet = Set(word.uppercased())
            return allowedCharacterSet.isSuperset(of: wordCharacterSet)
        }
        
        self.panagrams = words.filter { word in
            let wordLettersSet = Set(word.uppercased())
            return wordLettersSet == allowedCharacterSet
        }
    }
    
    func isValid(currentWord: String, foundWords: [String]) -> Bool {
        return self.words.contains(currentWord.lowercased()) && !foundWords.contains(currentWord.lowercased())
    }
    
    func wordScore(currentWord: String) -> Int {
        var score = 0
        score += currentWord.count == 4 ? 1 : currentWord.count
        
        
        let currentWordLetters = Set(currentWord.lowercased())
        let allLettersUsed = self.letters.allSatisfy { letter in
            currentWordLetters.contains(letter.lowercased())
        }
        
        if allLettersUsed {
            score += 10
        }
        
        return score
    }
}
