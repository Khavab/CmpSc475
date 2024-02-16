//
//  BoardView.swift
//  Pentominoes
//
//  Created by Shibli Nomani on 2/1/24.
//

import SwiftUI

struct BoardView: View {
    var puzzleOutline: PuzzleOutline?
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                ForEach(0..<14, id: \.self) { row in
                    HStack(spacing: 0) {
                        ForEach(0..<14, id: \.self) { column in
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 15, height: 15)
                                .border(Color.black, width: 1)
                        }
                    }
                }
            }
            if let puzzleOutline = puzzleOutline {
                PuzzleShapeView(puzzleOutline: puzzleOutline)
                    .offset(CGSize(width: (210 - 15 * puzzleOutline.size.width) / 2, height: (210 - 15 * puzzleOutline.size.height) / 2))
            }
        }
        .frame(width: 210, height: 210)
    }
}


struct PuzzleShapeView: View {
    var puzzleOutline: PuzzleOutline
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(puzzleOutline.outlines, id: \.self) { outline in
                    Path { path in
                        for point in outline {
                            let x = CGFloat(point.x) * (15)
                            let y = CGFloat(point.y) * (15)
                            let point = CGPoint(x: x, y: y)
                            if path.isEmpty {
                                path.move(to: point)
                            } else {
                                path.addLine(to: point)
                            }
                        }
                    }
                    .fill(Color.gray)
                    .opacity(0.5)
                }
            }
        }
    }
}
