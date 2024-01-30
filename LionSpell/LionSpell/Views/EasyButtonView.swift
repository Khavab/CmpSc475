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
    let letter: SpellLetter
    
    var body: some View {
        let centeredLetters = centeredSpellLetters()
        ZStack {
            EasyButton(cent: false, spellLetter: centeredLetters[0])
                .offset(x: -60, y: -60)
            EasyButton(cent: false, spellLetter: centeredLetters[1])
                .offset(x: 60, y: -60)
            EasyButton(cent: true, spellLetter: centeredLetters[2])
            EasyButton(cent: false, spellLetter: centeredLetters[3])
                .offset(x: -60, y: 60)
            EasyButton(cent: false, spellLetter: centeredLetters[4])
                .offset(x: 60, y: 60)
        }
        .frame(width: 400, height: 220)
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

struct EasyButton: View {
    let cent: Bool
    let spellLetter: SpellLetter
    
    var body: some View {
        Button(action: {print("Button pressed")}){
            Text(spellLetter.letter)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundColor(cent ? Color.primaryLightColor : .white)
                .background(RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .frame(width: 75, height: 75)
                    .foregroundColor(cent ? Color.primaryButtonColor : Color.primaryLightColor)
                    .rotationEffect(.degrees(45)))
        }
        
    }
}


