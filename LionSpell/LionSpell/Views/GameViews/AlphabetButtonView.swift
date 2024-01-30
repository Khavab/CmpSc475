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
    let letter: SpellLetter

    var body: some View {
        HStack(spacing: 5) {
            let centeredLetters = centeredSpellLetters()

            ForEach(centeredLetters.indices, id: \.self) { index in
                let spellLetter = centeredLetters[index]
                Button(action: { addLetter(spellLetter.letter) }) {
                    Text(spellLetter.letter)
                        .frame(width: 70, height: 70)
                        .foregroundColor(index == centeredLetters.count / 2 ? Color.primaryLightColor : .white)
                        .background(index == centeredLetters.count / 2 ? Color.primaryButtonColor : Color.primaryLightColor)
                        .cornerRadius(5)
                }
            }
        }
    }

    private func centeredSpellLetters() -> [SpellLetter] {
        var letters = spellLetters
        if let centerIndex = letters.firstIndex(where: { $0.letter == letter.letter }) {
            letters.remove(at: centerIndex)
        }

        let halfIndex = letters.count / 2
        letters.insert(letter, at: halfIndex)
        return letters
    }
}
