//
//  SettingsValues.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/29/24.
//

import Foundation

enum Difficulty: String, CaseIterable, Identifiable {
    case easy, medium, hard
    
    var id: Self { self }
    
    var associatedInt: Int {
        switch self {
        case .easy:
            return 5
        case .medium:
            return 6
        case .hard:
            return 7
        }
    }
}


enum Language: String, CaseIterable, Identifiable {
    case english, french
    var id: Self { self }
    
    var associatedLanguage: [String] {
        switch self {
        case .english:
            return Words.words
        case .french:
            return Words.frenchWords
        }
    }
}
