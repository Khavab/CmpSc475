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
}

enum Language: String, CaseIterable, Identifiable {
    case english, french
    var id: Self { self }
}
