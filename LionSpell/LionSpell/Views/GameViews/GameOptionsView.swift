//
//  GameOptionsView.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

struct GameOptionsView: View {
    let newGame: () -> Void
    let shuffle: () -> Void
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 10) {
                NavigationLink(destination: HintView()) {
                    HStack {
                        Image(systemName: "questionmark.circle")
                            .foregroundColor(Color.primaryLightColor)
                        Text("Show Hint")
                            .foregroundColor(Color.primaryLightColor)
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .frame(height: 80)
                    .background(Color.primaryButtonColor)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                }
                .frame(width: (geometry.size.width - 20) / 3)

                ControlButton(label: "New Game", systemImage: "plus.circle", action: { newGame() })
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
