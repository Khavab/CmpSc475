//
//  AlphabetButtonView.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

struct AlphabetButtonsView: View {
    let addLetter: (String) -> Void
    let spellLetters: [SpellLetter]
    var body: some View {
        HStack(spacing: 5) {
            ForEach(spellLetters) { letter in
                Button(action: { addLetter(letter.letter) }) {
                    Text(letter.letter)
                        .frame(width: 70, height: 70)
                        .foregroundColor(.white)
                        .background(Color.primaryLightColor)
                        .cornerRadius(5)
                }
            }
        }
    }
}
