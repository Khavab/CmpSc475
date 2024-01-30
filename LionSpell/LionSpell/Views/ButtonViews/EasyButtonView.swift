//
//  EasyButtonView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/30/24.
//

import SwiftUI

struct EasyButtonView: View {
    let addLetter: (String) -> Void
    let letters: [Character]
    var body: some View {
        EasyButton(addLetter: addLetter, cent: true, letter: letters[0])
        EasyButton(addLetter: addLetter, cent: false, letter: letters[1])
            .offset(x: -60, y: -60)
        EasyButton(addLetter: addLetter, cent: false, letter: letters[2])
            .offset(x: 60, y: -60)
        EasyButton(addLetter: addLetter, cent: false, letter: letters[3])
            .offset(x: -60, y: 60)
        EasyButton(addLetter: addLetter, cent: false, letter: letters[4])
            .offset(x: 60, y: 60)
    }
}
