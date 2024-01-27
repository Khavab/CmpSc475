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
    
    @Published var letters: [SpellLetter] = []
    @Published var isValid: Bool = false
    @Published var scramble: Scramble = Scramble(size: 5, words: Words.words)    
    
    init(size: Int) {
        newGame(size: size)
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
    
    func showHint() {
        
    }
    
    func newGame(size: Int) {
        scramble = Scramble(size: size, words: Words.words)
        letters = scramble.letters
        shuffleLetters()
        score = 0
        foundWords = []
        currentWord = ""
        isValid = false
        
    }

    func shuffleLetters() {
        letters.shuffle()
    }
}

struct SpellLetter: Identifiable {
    let letter: String
    let id = UUID()
}
