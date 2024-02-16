//
//  GameView.swift
//  Pentominoes
//
//  Created by Shibli Nomani on 2/15/24.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var gameManager: GameManager
    var body: some View {
        ZStack {
            BoardView(puzzleOutline: gameManager.board)
            
            ForEach(gameManager.pieces.indices, id: \.self) { index in
                let piece = gameManager.pieces[index]
                PieceView(piece: piece)
            }
        }
        .frame(width: 250, height: 800)
    }
}

#Preview {
    GameView()
        .environmentObject(GameManager())
}
