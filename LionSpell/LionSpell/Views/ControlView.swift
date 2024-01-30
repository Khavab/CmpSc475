//
//  ControlView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/25/24.
//

import SwiftUI

struct ControlView: View {
    @StateObject var gameManager = GameViewModel()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.primaryBackgroundColor.ignoresSafeArea()
                VStack(spacing: 15) {
                    TopHeaderView(preferences: $gameManager.preferences)
                    
                    GameOptionsView(
                        newGame: gameManager.newGame,
                        shuffle: gameManager.shuffleLetters
                    )
                    .padding(.top, 10)
                    
                    PointsView(score: gameManager.score)
                        .padding(.top, 10)
                    
                    DiscoveredWordsView(foundWords: gameManager.foundWords)
                        .padding(.top, 10)
                    
                    CurrentWordView(currentWord: gameManager.currentWord)
                        .padding(.top, 10)
                    
                    AlphabetButtonsView(addLetter: gameManager.addLetter, spellLetters: gameManager.letters, letter: gameManager.letter)
                        .padding(.top, 10)
                    
                    ActionButtonsView(submitAction: gameManager.submitWord,
                                      deleteAction: gameManager.deleteWord,
                                      isValid: gameManager.isValid,
                                      currentWord: gameManager.currentWord)
                }
                .padding()
            }
        }
        .environmentObject(gameManager)
    }
}

#Preview {
    ControlView()
}
