//
//  CurrentWordView.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

struct CurrentWordView: View {
    let currentWord: String
    var body: some View {
        Text(currentWord)
            .font(.title)
            .frame(width: 400, height: 70)
            .background(Color.currentWordBG)
            .cornerRadius(10)
            .padding(.horizontal, 10)
    }
}
