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
                VStack(spacing: 25) {
                    TopHeaderView(preferences: $gameManager.preferences)
                    
                    GameOptionsView(newGame: gameManager.newGame, shuffle: gameManager.shuffleLetters)
                    
                    DiscoveredWordsView(foundWords: gameManager.foundWords)
                    
                    CurrentWordView(currentWord: gameManager.currentWord)
                    
                    ButtonView()
                    
                    ActionButtonsView(submitAction: gameManager.submitWord,
                                      deleteAction: gameManager.deleteWord,
                                      isValid: gameManager.isValid,
                                      currentWord: gameManager.currentWord)
                    .frame(width: 340)
                }
                .padding()
            }
        }
        .environmentObject(gameManager)
    }
}

#Preview {
    ControlView()
        .environmentObject(GameViewModel())
}
