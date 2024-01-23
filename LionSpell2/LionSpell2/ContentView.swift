import SwiftUI

struct ContentView: View {
    @StateObject var gameManager = GameViewModel(size: 5)
    var body: some View {
        ZStack {
            Color(red: 230/256, green: 164/256, blue: 180/256).ignoresSafeArea()
            
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

struct TopHeaderView: View {
    var body: some View {
        HStack {
            Image("AppIcon")
            Spacer()
            Text("Lion Spell")
                .font(.title)
                .fontWeight(.medium)
            Spacer()
            Image(systemName: "gearshape.fill")
        }
    }
}

struct PointsView: View {
    var score: Int
    var body: some View {
        HStack {
            Text(String(score))
                .font(.title)
                .fontWeight(.bold)
            Text("points")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct DiscoveredWordsView: View {
    var foundWords: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 5) {
                    ForEach(foundWords, id: \.self) { word in
                        Text(word)
                            .padding(5)
                            .background(Color.white)
                            .cornerRadius(5)
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 100)
        }
        .background(Color(red: 243/256, green: 215/256, blue: 202/256))
        .cornerRadius(10)
        .frame(width: 350)
    }
}


struct CurrentWordView: View {
    var currentWord: String
    var body: some View {
        Text(currentWord)
            .font(.title)
            .frame(maxWidth: .infinity)
            .frame(height:70)
            .background(Color(red: 245/256, green: 236/256, blue: 230/256))
            .cornerRadius(10)
            .padding(.horizontal, 10)
    }
}

struct AlphabetButtonsView: View {
    var addLetter: (String) -> Void
    var spellLetters: [SpellLetter]
    var body: some View {
        HStack(spacing: 5) {
            ForEach(spellLetters) { letter in
                Button(action: { addLetter(letter.letter) }) {
                    Text(letter.letter)
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                        .background(Color(red: 176/256, green: 97/256, blue: 97/256))
                        .cornerRadius(5)
                }
            }
        }
    }
}


struct GameOptionsView: View {
    let showHint: () -> Void
    let newGame: () -> Void
    let shuffle: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 10) {
                ControlButton(label: "Show Hint", systemImage: "questionmark.circle", action: showHint)
                    .frame(width: (geometry.size.width - 20) / 3)
                ControlButton(label: "New Game", systemImage: "plus.circle", action: newGame)
                    .frame(width: (geometry.size.width - 20) / 3)
                ControlButton(label: "Shuffle", systemImage: "shuffle.circle", action: shuffle)
                    .frame(width: (geometry.size.width - 20) / 3)
            }
        }
        .frame(height: 70)
    }
}

struct ControlButton: View {
    var label: String
    var systemImage: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: systemImage)
                    .foregroundColor(Color(red: 176/256, green: 97/256, blue: 97/256))
                Text(label)
                    .foregroundColor(Color(red: 176/256, green: 97/256, blue: 97/256))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(Color(red: 255/256, green: 248/256, blue: 227/256))
            .foregroundColor(.white)
            .cornerRadius(15)
        }
    }
}

struct ActionButtonsView: View {
    let submitAction: () -> Void
    let deleteAction: () -> Void
    let isValid: Bool
    let currentWord: String

    var body: some View {
        HStack {
            Button(action: deleteAction) {
                Label("Delete", systemImage: "delete.right.fill")
            }
            .buttonStyle(StyledButton(backgroundColor: .red))
            .disabled(currentWord.count == 0)

            Spacer()

            Button(action: submitAction) {
                Label("Submit", systemImage: "checkmark.circle.fill")
            }
            .buttonStyle(StyledButton(backgroundColor: .green))
            .disabled(!isValid)
        }
    }
}



struct StyledButton: ButtonStyle {
    var backgroundColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}

#Preview {
    ContentView()
}
