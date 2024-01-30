//
//  GameManager.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import Foundation

class GameViewModel: ObservableObject {
    @Published var scramble: Scramble
    @Published var letters: [SpellLetter]
    @Published var score: Int
    @Published var words: [String]
    @Published var panagrams: [String]
    @Published var isValid: Bool
    @Published var foundWords: [String] {
        didSet {
            updateIsValid()
        }
    }
    @Published var currentWord: String {
        didSet {
            updateIsValid()
        }
    }
    @Published var preferences: Preferences {
        didSet {
            newGame()
        }
    }
    
    init() {
        let tempP = Preferences()
        let tempS = Scramble(preferences: tempP)
        scramble = tempS
        preferences = tempP
        letters = tempS.letters
        words = tempS.words
        panagrams = tempS.panagrams
        score = 0
        foundWords = []
        currentWord = ""
        isValid = false
    }

    func submitWord() {
        score += scramble.wordScore(currentWord: currentWord)
        foundWords.append(currentWord.lowercased())
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
        isValid = scramble.isValid(currentWord: currentWord, foundWords: foundWords)
    }
    
    func newGame() {
        scramble = Scramble(preferences: preferences)
        letters = scramble.letters
        words = scramble.words
        panagrams = scramble.panagrams
        shuffleLetters()
        score = 0
        foundWords = []
        currentWord = ""
        isValid = false
    }
    
    func totalPoints() -> String {
        var t = 0
        
        for word in words {
            t += word.count
        }
        
        return String(t)
    }

    func shuffleLetters() {
        var shuffledPart = Array(letters[1...])
        shuffledPart.shuffle()
        letters = [letters[0]] + shuffledPart
    }
}
