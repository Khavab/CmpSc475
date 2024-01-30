//
//  SpellLetters.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/30/24.
//

import Foundation

struct SpellLetter: Identifiable {
    let letter: String
    var id: String { letter }
    
    static func == (lhs: SpellLetter, rhs: SpellLetter) -> Bool {
            return lhs.letter == rhs.letter
        }
}
