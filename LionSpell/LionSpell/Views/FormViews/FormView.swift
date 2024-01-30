//
//  FormView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/25/24.
//

import SwiftUI

struct FormView: View {
    @State private var selectedDifficulty: Difficulty = .easy
    @State private var selectedLanguage: Language = .english
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Difficulty")) {
                    PickerView(selection: $selectedDifficulty, options: Difficulty.allCases)
                }
                Section(header: Text("Language")) {
                    PickerView(selection: $selectedLanguage, options: Language.allCases)
                }
            }
        }
    }
}

#Preview {
    FormView()
}
