//
//  ContentView.swift
//  LionSpell1
//
//  Created by Shibli Nomani on 1/22/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.9, green: 0.9, blue: 0.9).ignoresSafeArea()
            
            VStack(spacing: 15) {
                HeaderView()
                
                ScoreView()
                    .padding(.top, 10)

                GameControlButtons()
                    .padding(.top, 10)
                
                FoundWordsView()
                
                CurrentWordView()
                    .padding(.top, 10)

                DeleteSubmitView(Action: {})
                    .padding(.top, 10)

                LetterButtons()
                    .padding(.bottom, 20)
            }
            .padding()
        }
    }
}

struct HeaderView: View {
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

struct ScoreView: View {
    var body: some View {
        HStack {
            Text("3500")
                .font(.title)
                .fontWeight(.bold)
            Text("points")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct FoundWordsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Found Words")
                .font(.headline)
            
            Text("- List of words found by user")
            Text("- Another word")
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
}

struct CurrentWordView: View {
    var body: some View {
        Text("Current word")
            .frame(maxWidth: .infinity)
            .background(Color.gray)
            .cornerRadius(10)
            .padding(.horizontal, 10)
    }
}

struct LetterButtons: View {
    var body: some View {
        HStack(spacing: 10) {
            ForEach(activeLetters) { letter in
                Button(letter.letter) {}
                    .frame(width: 50, height: 50)
                    .foregroundColor(.white)
                    .background(Color.orange)
                    .cornerRadius(25)
            }
        }
    }
}

struct GameControlButtons: View {
    var body: some View {
        HStack(spacing: 10) {
            GameControlButton(label: "Show Hint", systemImage: "questionmark.circle", action: {})
            GameControlButton(label: "New Game", systemImage: "plus.circle", action: {})
            GameControlButton(label: "Shuffle", systemImage: "shuffle.circle", action: {})
        }
    }
}

struct GameControlButton: View {
    var label: String
    var systemImage: String
    var action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: systemImage)
                Text(label)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(15)
        }
    }
}


struct DeleteSubmitView: View {
    let Action: () -> Void

    var body: some View {
        HStack {
            Button(action: Action) {
                Label("Delete", systemImage: "delete.right.fill")
            }
            .buttonStyle(PrimaryButtonStyle(backgroundColor: .red))

            Spacer()

            Button(action: Action) {
                Label("Submit", systemImage: "checkmark.circle.fill")
            }
            .buttonStyle(PrimaryButtonStyle(backgroundColor: .green))
        }
    }
}

struct ActiveLetter: Identifiable {
    let letter: String
    let id = UUID()
}

let activeLetters = [
    ActiveLetter(letter: "A"),
    ActiveLetter(letter: "B"),
    ActiveLetter(letter: "C"),
    ActiveLetter(letter: "D"),
    ActiveLetter(letter: "E")
]


struct PrimaryButtonStyle: ButtonStyle {
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
