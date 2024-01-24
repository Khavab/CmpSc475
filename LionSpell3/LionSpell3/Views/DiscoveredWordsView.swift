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
        VStack(alignment: .leading, spacing: 10) {
            ScrollView(.horizontal, showsIndicators: true) {
                HStack(spacing: 5) {
                    ForEach(foundWords, id: \.self) { word in
                        Text(word)
                            .padding(5)
                            .background(Color.white)
                            .cornerRadius(5)
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 100)
        }
        .background(Color.discoveredWordBG)
        .cornerRadius(10)
        .frame(width: 350)
    }
}
