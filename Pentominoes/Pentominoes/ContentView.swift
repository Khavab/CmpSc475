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
            VStack {
                HStack {
                    PuzzleButtonView(images: [Image("Board0"), Image("Board1"), Image("Board2"), Image("Board3")], st: 0)
                    
                    BoardView(puzzleOutline: gameManager.board)
                    
                    PuzzleButtonView(images: [Image("Board4"), Image("Board5"), Image("Board6"), Image("Board7")], st: 1)
                }
                HStack {
                    Button(action: {}) {
                        Text("Reset")
                            .foregroundColor(.red)
                    }
                    
                    
                    Button(action: {}) {
                        Text("Solve")
                            .foregroundColor(.red)
                    }
                }
            }
            .position(CGPoint(x: 200.0, y: 180.0))
            ForEach(gameManager.pieces.indices, id: \.self) { index in
                let piece = gameManager.pieces[index]
                PieceView(piece: piece)
                    .position(x: CGFloat(piece.position.x), y: CGFloat(piece.position.y))
            }

        }
        .environmentObject(gameManager)
    }
}

#Preview {
    ContentView()
}
