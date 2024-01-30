//
//  WordView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/29/24.
//

import SwiftUI

struct WordView: View {
    let title: String
    let words: [String]
    
    var body: some View {
        Form {
            Section(header: Text(title)) {
                ForEach(words, id: \.self) { word in
                    Text(word)
                }
            }
        }
    }
}

#Preview {
    WordView(title: "title", words: ["test1","test2","test3","test4"])
}
