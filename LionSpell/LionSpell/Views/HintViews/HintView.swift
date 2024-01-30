//
//  HintView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/27/24.
//

import SwiftUI

struct HintView: View {
    @EnvironmentObject var gameManager: GameViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Summary")) {
                    NavigationLink(destination: WordView(title: "Words", words: gameManager.words)) {
                        Text("Total number of words: \(gameManager.words.count)")
                    }
                    Text("Total possible points: \(gameManager.totalPoints())")
                    NavigationLink(destination: WordView(title: "Panagrams", words: gameManager.panagrams)) {
                        Text("Number of Panagrams: \(gameManager.panagrams.count)")
                    }
                }
                
                let wordsByLength = Dictionary(grouping: gameManager.words, by: { $0.count })
                
                ForEach(wordsByLength.keys.sorted(), id: \.self) { length in
                    Section(header: Text("Words of length \(length)")) {
                        ForEach(gameManager.letters, id: \.id) { letter in
                            let wordsStartingWithLetter = gameManager.words.filter { $0.starts(with: letter.letter.lowercased()) && $0.count == length }
                            if !wordsStartingWithLetter.isEmpty {
                                NavigationLink(destination: WordView(title: "\(letter.letter): \(length)", words: wordsStartingWithLetter)) {
                                    Text("\(letter.letter): \(wordsStartingWithLetter.count) words")
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    HintView()
        .environmentObject(GameViewModel())
}
