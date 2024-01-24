import SwiftUI

struct ContentView: View {
    @EnvironmentObject var gameManager: GameViewModel
    
    var body: some View {
        ZStack {
            Color.primaryBackgroundColor.ignoresSafeArea()
            
            VStack(spacing: 15) {
                TopHeaderView()
                
                GameOptionsView(showHint: gameManager.showHint, newGame: gameManager.newGame, shuffle: gameManager.shuffleLetters)
                    .padding(.top, 10)
                
                PointsView(score: gameManager.score)
                    .padding(.top, 10)
                                
                DiscoveredWordsView(foundWords: gameManager.foundWords)
                    .padding(.top, 10)
                
                CurrentWordView(currentWord: gameManager.currentWord)
                    .padding(.top, 10)
                
                AlphabetButtonsView(addLetter: gameManager.addLetter, spellLetters: gameManager.letters)
                    .padding(.top, 10)
                
                ActionButtonsView(submitAction: gameManager.submitWord,
                                  deleteAction: gameManager.deleteWord,
                                  isValid: gameManager.isValid,
                                  currentWord: gameManager.currentWord)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(GameViewModel(size: 5))
}
