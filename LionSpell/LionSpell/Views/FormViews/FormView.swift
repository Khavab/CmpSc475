//
//  FormView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/25/24.
//

import SwiftUI

struct FormView: View {
    @Binding var preferences: Preferences
    
    private var selectedDifficultyBinding: Binding<Difficulty> {
        Binding<Difficulty>(
            get: { self.preferences.difficulty },
            set: { self.preferences.difficulty = $0 }
        )
    }
    
    private var selectedLanguageBinding: Binding<Language> {
        Binding<Language>(
            get: { self.preferences.language },
            set: { self.preferences.language = $0 }
        )
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Difficulty")) {
                    PickerView(selection: selectedDifficultyBinding, options: Difficulty.allCases)
                }
                Section(header: Text("Language")) {
                    PickerView(selection: selectedLanguageBinding, options: Language.allCases)
                }
            }
        }
    }
}

