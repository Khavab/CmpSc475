//
//  ButtonView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/30/24.
//

import SwiftUI

struct ButtonView: View {
    @EnvironmentObject var gameManager: GameViewModel
    var body: some View {
        ZStack {
            if gameManager.preferences.difficulty == Difficulty.easy {
                EasyButtonView(addLetter: gameManager.addLetter, letters: gameManager.letters)
            }
            else if gameManager.preferences.difficulty == Difficulty.medium {
                MediumButtonView(addLetter: gameManager.addLetter, letters: gameManager.letters)
            }
            else {
                HardButtonView(addLetter: gameManager.addLetter, letters: gameManager.letters)
            }
        }
        .frame(width: 400, height: 250)
    }
}

#Preview {
    ButtonView()
        .environmentObject(GameViewModel())
}
