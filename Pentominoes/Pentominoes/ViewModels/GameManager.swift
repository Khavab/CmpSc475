//
//  GameManager.swift
//  Pentominoes
//
//  Created by Shibli Nomani on 2/1/24.
//

import Foundation

class GameManager : ObservableObject {
    @Published var pieces : [Piece] = []
    @Published var board: PuzzleOutline?
    @Published var puzzles: [PuzzleOutline] = []
    let decoder = JSONDecoder()
    
    init() {
        loadPentaminoPieces()
        loadPuzzleOutlines()
    }
    
    func loadPentaminoPieces() {
        let url = Bundle.main.url(forResource: "PentominoOutlines", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        let PentominoOutline = try! decoder.decode([PentominoOutline].self, from: data)
                
        for (index, outline) in PentominoOutline.enumerated() {
            let row = index / 4
            let column = index % 4
            
            let xPosition = column * 75 + 25
            let yPosition = row * 75 + 550
            
            let position = Position(x: xPosition, y: yPosition)
            let piece = Piece(position: position, outline: outline)
            
            pieces.append(piece)
        }
    }
    
    func loadPuzzleOutlines() {
        let url = Bundle.main.url(forResource: "PuzzleOutlines", withExtension: "json")!
        let data = try! Data(contentsOf: url)
        puzzles = try! decoder.decode([PuzzleOutline].self, from: data)
        
        board = nil
    }
    
    func setBoard(pos: Int) {
        if pos == -1 {
            board = nil
        }
        else {
            board = puzzles[pos]
        }
    }
    
    func reset() {
        for (index, _) in pieces.enumerated() {
            let row = index / 4
            let column = index % 4
            
            let xPosition = column * 75 + 25
            let yPosition = row * 75 + 550
            
            let position = Position(x: xPosition, y: yPosition)
            pieces[index].position = position
        }
    }
}
