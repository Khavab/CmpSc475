//
//  DiscoveredWordsView.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

struct DiscoveredWordsView: View {
    let foundWords: [String]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            HStack(spacing: 5) {
                ForEach(foundWords, id: \.self) { word in
                    Text(word)
                        .padding(.trailing, 5)
                        .cornerRadius(5)
                        .font(.title)
                }
            }
            .padding(.horizontal)
        }
        .frame(height: 70)
        .background(Color.discoveredWordBG)
        .cornerRadius(10)
        .frame(width: 400)
    }
}
