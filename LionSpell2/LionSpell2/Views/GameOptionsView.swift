//
//  GameOptionsView.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

struct GameOptionsView: View {
    let showHint: () -> Void
    let newGame: () -> Void
    let shuffle: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 10) {
                ControlButton(label: "Show Hint", systemImage: "questionmark.circle", action: showHint)
                    .frame(width: (geometry.size.width - 20) / 3)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
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
