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
                        Text("Total number of words: " + String(gameManager.words.count))
                    }
                    Text("Total possible points: " + gameManager.totalPoints())
                    NavigationLink(destination: WordView(title: "Panagrams", words: gameManager.panagrams)) {
                        Text("Number of Panagrams: " + String(gameManager.panagrams.count))
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
