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
        Form {
            SummarySection

            ForEach(groupWordsByLength().sorted(by: { $0.key < $1.key }), id: \.key) { length, wordGroups in
                Section(header: Text("\(length) Letter Words")) {
                    ForEach(wordGroups.sorted(by: { $0.key < $1.key }), id: \.key) { letter, words in
                        NavigationLink(destination: WordView(title: "\(letter) Words", words: words)) {
                            Text("\(letter) - \(words.count) Words")
                        }
                    }
                }
            }
        }
    }
    
    private var SummarySection: some View {
        Section(header: Text("Summary")) {
            NavigationLink(destination: WordView(title: "Words", words: gameManager.words)) {
                Text("Total number of words: \(gameManager.words.count)")
            }
            Text("Total possible points: \(gameManager.totalPoints())")
            NavigationLink(destination: WordView(title: "Panagrams", words: gameManager.panagrams)) {
                Text("Number of Panagrams: \(gameManager.panagrams.count)")
            }
        }
    }

    private func groupWordsByLength() -> [Int: [String: [String]]] {
        var groupedWords = [Int: [String: [String]]]()
        
        for word in gameManager.words {
            let length = word.count
            let firstLetter = String(word.prefix(1)).uppercased()
            
            groupedWords[length, default: [:]][firstLetter, default: []].append(word)
        }
        
        return groupedWords
    }
}

#Preview {
    HintView()
        .environmentObject(GameViewModel())
}
