//
//  GameOptionsView.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

struct GameOptionsView: View {
    let showHint: () -> Void
    let newGame: (Int) -> Void
    let shuffle: () -> Void
    let size: Int
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 10) {
                ControlButton(label: "Show Hint", systemImage: "questionmark.circle", action: showHint)
                    .frame(width: (geometry.size.width - 20) / 3)
                    .disabled(/*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                ControlButton(label: "New Game", systemImage: "plus.circle", action: { newGame(size) })
                                    .frame(width: (geometry.size.width - 20) / 3)
                ControlButton(label: "Shuffle", systemImage: "shuffle.circle", action: shuffle)
                    .frame(width: (geometry.size.width - 20) / 3)
            }
        }
        .frame(height: 70)
    }
}

struct ControlButton: View {
    let label: String
    let systemImage: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack {
                Image(systemName: systemImage)
                    .foregroundColor(Color.primaryLightColor)
                Text(label)
                    .foregroundColor(Color.primaryLightColor)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 80)
            .background(Color.primaryButtonColor)
            .foregroundColor(.white)
            .cornerRadius(15)
        }
    }
}
