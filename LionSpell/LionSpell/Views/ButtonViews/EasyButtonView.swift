//
//  EasyButtonView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/30/24.
//

import SwiftUI

struct EasyButtonView: View {
    let addLetter: (String) -> Void
    let spellLetters: [SpellLetter]
    var body: some View {
        EasyButton(addLetter: addLetter, cent: true, spellLetter: spellLetters[0])
        EasyButton(addLetter: addLetter, cent: false, spellLetter: spellLetters[1])
            .offset(x: -60, y: -60)
        EasyButton(addLetter: addLetter, cent: false, spellLetter: spellLetters[2])
            .offset(x: 60, y: -60)
        EasyButton(addLetter: addLetter, cent: false, spellLetter: spellLetters[3])
            .offset(x: -60, y: 60)
        EasyButton(addLetter: addLetter, cent: false, spellLetter: spellLetters[4])
            .offset(x: 60, y: 60)
    }
}

struct EasyButton: View {
    let addLetter: (String) -> Void
    let cent: Bool
    let spellLetter: SpellLetter
    
    var body: some View {
        Button(action: { addLetter(spellLetter.letter) } ){
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .frame(width: 75, height: 75)
                    .foregroundColor(cent ? Color.primaryButtonColor : Color.primaryLightColor)
                Text(spellLetter.letter)
                    .font(.title)
                    .foregroundColor(cent ? Color.primaryLightColor : .white)
                    .rotationEffect(.degrees(-45))
            }
        }
        .rotationEffect(.degrees(45))
    }
}

