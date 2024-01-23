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
            Color(red: 230/256, green: 164/256, blue: 180/256).ignoresSafeArea()
            
            VStack(spacing: 15) {
                HeaderView()
                
                GameControlButtons()
                    .padding(.top, 10)
                
                ScoreView()
                    .padding(.top, 10)
                
                FoundWordsView()
                
                CurrentWordView()
                    .padding(.top, 10)
                
                LetterButtons()
                    .padding(.top, 10)
                
                DeleteSubmitView(Action: {})

                
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
            Text("38")
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
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 5) {
                    Text("Word")
                        .font(.title)
                    Text("Word")
                        .font(.title)
                    Text("Word")
                        .font(.title)
                    Text("Word")
                        .font(.title)
                    Text("Word")
                        .font(.title)

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
    var body: some View {
        Text("Current word")
            .frame(maxWidth: .infinity)
            .background(Color(red: 245/256, green: 236/256, blue: 230/256))
            .cornerRadius(10)
            .padding(.horizontal, 10)
    }
}

struct LetterButtons: View {
    var body: some View {
        HStack(spacing: 5) {
            ForEach(activeLetters) { letter in
                Button(letter.letter) {}
                    .frame(width: 70, height: 70)
                    .foregroundColor(.white)
                    .background(Color(red: 176/256, green: 97/256, blue: 97/256))
                    .cornerRadius(5)
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
                    .foregroundColor(Color(red: 176/256, green: 97/256, blue: 97/256))
                Text(label)
                    .foregroundColor(Color(red: 176/256, green: 97/256, blue: 97/256))
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(red: 255/256, green: 248/256, blue: 227/256))
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
