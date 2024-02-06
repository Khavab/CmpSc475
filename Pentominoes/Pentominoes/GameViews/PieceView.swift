//
//  PieceView.swift
//  Pentominoes
//
//  Created by Shibli Nomani on 2/1/24.
//

import SwiftUI

struct PieceView: View {
    let piece: Piece
    
    var body: some View {
        PentominoView(outline: piece.outline, color: Color.blue)
            .frame(width: calculateWidth(), height: calculateHeight())
            //.position(x: calculateXPosition(), y: calculateYPosition())
    }
    
    private func calculateWidth() -> CGFloat {
        let unitWidth = CGFloat(20)
        return CGFloat(piece.outline.size.width) * unitWidth
    }
    
    private func calculateHeight() -> CGFloat {
        let unitHeight = CGFloat(20)
        return CGFloat(piece.outline.size.height) * unitHeight
    }
    
    private func calculateXPosition() -> CGFloat {
        let unitWidth = CGFloat(20)
        return CGFloat(piece.position.x) * unitWidth
    }
    
    private func calculateYPosition() -> CGFloat {
        let unitHeight = CGFloat(20)
        return CGFloat(piece.position.y) * unitHeight
    }
}


struct PentominoView: View {
    let outline: PentominoOutline
    let color: Color

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let unitWidth = CGFloat(20)
                let unitHeight = CGFloat(20)
                
                Path { path in
                    for (index, point) in outline.outline.enumerated() {
                        let x = CGFloat(point.x) * unitWidth
                        let y = CGFloat(point.y) * unitHeight
                        
                        if index == 0 {
                            path.move(to: CGPoint(x: x, y: y))
                        } else {
                            path.addLine(to: CGPoint(x: x, y: y))
                        }
                    }
                }
                .stroke(Color.black, lineWidth: 1) // Grid line color and width
                .fill(color)
            }
        }
    }
}



