//
//  CurrentWordView.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

struct CurrentWordView: View {
    var currentWord: String
    var body: some View {
        Text(currentWord)
            .font(.title)
            .frame(maxWidth: .infinity)
            .frame(height:70)
            .background(Color(red: 245/256, green: 236/256, blue: 230/256))
            .cornerRadius(10)
            .padding(.horizontal, 10)
    }
}
