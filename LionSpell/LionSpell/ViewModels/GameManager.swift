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
    
    @Published var preferences: Preferences = Preferences() {
        didSet {
            newGame()
        }
    }
    @Published var letter: SpellLetter =  SpellLetter(letter: "A")
    @Published var letters: [SpellLetter] = []
    @Published var words: [String] = []
    @Published var panagrams: [String] = []
    @Published var isValid: Bool = false
    @Published var scramble: Scramble = Scramble(preferences: Preferences())
    
    init() {
        newGame()
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
        letter = scramble.letter
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
        letters.shuffle()
    }
}

struct SpellLetter: Identifiable {
    let letter: String
    var id: String { letter }
    
    static func == (lhs: SpellLetter, rhs: SpellLetter) -> Bool {
            return lhs.letter == rhs.letter
        }
}
