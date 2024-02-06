//
//  PuzzleButtonView.swift
//  Pentominoes
//
//  Created by Shibli Nomani on 2/2/24.
//

import SwiftUI

struct PuzzleButtonView: View {
    @EnvironmentObject var gameManager: GameManager
    let images: [Image]
    let st: Int
    
    var body: some View {
        VStack {
            ForEach(0..<images.count, id: \.self) { index in
                PuzzleButton(image: images[index], action: {
                    gameManager.setBoard(pos: index + st * 4 - 1)
                })
            }
        }
    }
}

struct PuzzleButton: View {
    let image: Image
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 50, height: 50)
        .buttonStyle(PlainButtonStyle())
    }
}

#Preview {
    PuzzleButtonView(images: [Image("Board0"), Image("Board1"), Image("Board2"), Image("Board3")], st: 0)
        .environmentObject(GameManager())
}

