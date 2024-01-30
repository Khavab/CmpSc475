//
//  MediumButtonView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/30/24.
//

import SwiftUI

struct MediumButtonView: View {
    let addLetter: (String) -> Void
    let letters: [Character]
    
    var body: some View {
        MediumButton(addLetter: addLetter, cent: true, letters: letters[0])
        MediumButton(addLetter: addLetter, cent: false, letters: letters[1])
            .offset(x: -50, y: -65)
        MediumButton(addLetter: addLetter, cent: false, letters: letters[2])
            .offset(x: 50, y: -65)
        MediumButton(addLetter: addLetter, cent: false, letters: letters[3])
            .offset(x: -80, y: 25)
        MediumButton(addLetter: addLetter, cent: false, letters: letters[4])
            .offset(x: 0, y: 80)
        MediumButton(addLetter: addLetter, cent: false, letters: letters[5])
            .offset(x: 80, y: 25)
    }
}
