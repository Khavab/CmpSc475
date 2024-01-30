//
//  HardButtonView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/30/24.
//

import SwiftUI

struct HardButtonView: View {
    let addLetter: (String) -> Void
    let letters: [Character]
    
    var body: some View {
        HardButton(addLetter:  addLetter, cent: true, letters: letters[0])
        HardButton(addLetter:  addLetter, cent: false, letters: letters[1])
            .offset(x: 0, y: -85)
        HardButton(addLetter:  addLetter, cent: false, letters: letters[2])
            .offset(x: -75, y: -45)
        HardButton(addLetter:  addLetter, cent: false, letters: letters[3])
            .offset(x: -75, y: 45)
        HardButton(addLetter:  addLetter, cent: false, letters: letters[4])
            .offset(x: 75, y: -45)
        HardButton(addLetter:  addLetter, cent: false, letters: letters[5])
            .offset(x: 75, y: 45)
        HardButton(addLetter:  addLetter, cent: false, letters: letters[6])
            .offset(x: 0, y: 85)
        
    }
}
