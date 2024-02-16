//
//  ContentView.swift
//  Pentominoes
//
//  Created by Shibli Nomani on 2/1/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameManager = GameManager()
    
    var body: some View {
        ZStack {
            Color.yellow.ignoresSafeArea()
            HStack {
                VStack {
                    PuzzleButtonView(images: [Image("Board0"), Image("Board1"), Image("Board2"), Image("Board3")], st: 0)
                    
                    Button(action: gameManager.reset) {
                        Text("Reset")
                            .foregroundColor(.red)
                    }
                }
                
                GameView()
                
                VStack {
                    PuzzleButtonView(images: [Image("Board4"), Image("Board5"), Image("Board6"), Image("Board7")], st: 1)
                    
                    
                    Button(action: {}) {
                        Text("Solve")
                            .foregroundColor(.red)
                    }
                    .disabled(gameManager.board == nil)
                     
                }
            }
            //.position(CGPoint(x: 200.0, y: 250.0))

        }
        .environmentObject(gameManager)
    }
}

#Preview {
    ContentView()
}
