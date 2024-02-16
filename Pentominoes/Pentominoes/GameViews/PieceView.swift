//
//  PieceView.swift
//  Pentominoes
//
//  Created by Shibli Nomani on 2/1/24.
//

import SwiftUI

struct PieceView: View {
    var piece: Piece
    @State private var originalPosition: CGSize = .zero
    @State private var currentPosition: CGSize
    @State var newPosition: CGSize = .zero
    @State private var isDragging = false
    @State private var rotation: Angle = .zero
    @State private var isFlipped = false
    
    // Assuming fixed sizes for simplicity
    let boardWidth: CGFloat = 210  // Width of BoardView
    let boardHeight: CGFloat = 210 // Height of BoardView
    let pieceWidth: CGFloat  // Width of this PieceView
    let pieceHeight: CGFloat // Height of this PieceView
    
    init(piece: Piece) {
        self.piece = piece
        self.pieceWidth = CGFloat(piece.outline.size.width) * 15
        self.pieceHeight = CGFloat(piece.outline.size.height) * 15
        self.currentPosition = CGSize(width: CGFloat(piece.position.x), height: CGFloat(piece.position.y))
    }
    
    var body: some View {
        PentominoView(outline: piece.outline, color: Color.blue)
            .frame(width: pieceWidth, height: pieceHeight)
            .offset(newPosition)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        if !isDragging {
                            self.originalPosition = newPosition
                            self.isDragging = true
                        }
                        self.newPosition = CGSize(width: value.translation.width + originalPosition.width,
                                                  height: value.translation.height + originalPosition.height)
                    }
                    .onEnded { _ in
                        withAnimation {
                            self.isDragging = false
                            // Check if the new position is within the bounds
                            if isPieceWithinBounds() {
                                // Update currentPosition to include the translation from the drag
                                self.currentPosition.width += self.newPosition.width
                                self.currentPosition.height += self.newPosition.height
                            }
                            else {
                                self.currentPosition = CGSize(width: CGFloat(piece.position.x), height: CGFloat(piece.position.y))
                            }
                            
                            // Reset newPosition (the offset) to zero regardless of whether the piece is in bounds or not
                            self.newPosition = .zero
                        }
                    }
            )
            .gesture(
                TapGesture()
                    .onEnded {
                        withAnimation {
                            self.rotation += .degrees(90)
                        }
                    }
            )
            .gesture(
                LongPressGesture()
                    .onEnded { _ in
                        withAnimation {
                            self.isFlipped.toggle()
                        }
                    }
            )
            .rotationEffect(rotation)
            .scaleEffect(isDragging ? 1.2 : 1.0)
            .scaleEffect(x: isFlipped ? -1 : 1, y: 1)
            .position(x: currentPosition.width, y: currentPosition.height)
    }
    
    private func isPieceWithinBounds() -> Bool {
        let inXBounds = Int(newPosition.width) + Int(currentPosition.width) > 20 && Int(newPosition.width) + Int(currentPosition.width) < 230
        let inYBounds = Int(newPosition.height) + Int(currentPosition.height) > 295 && Int(newPosition.height) + Int(currentPosition.height) < 505
        
        return inXBounds && inYBounds
    }
    
    private func calculateWidth() -> CGFloat {
        let unitWidth = CGFloat(15)
        return CGFloat(piece.outline.size.width) * unitWidth
    }
    
    private func calculateHeight() -> CGFloat {
        let unitHeight = CGFloat(15)
        return CGFloat(piece.outline.size.height) * unitHeight
    }
    
    private func calculateXPosition() -> CGFloat {
        let unitWidth = CGFloat(15)
        return CGFloat(piece.position.x) * unitWidth
    }
    
    private func calculateYPosition() -> CGFloat {
        let unitHeight = CGFloat(15)
        return CGFloat(piece.position.y) * unitHeight
    }
}


struct PentominoOutlineShape: Shape {
    let outline: PentominoOutline
    let unitWidth: CGFloat
    let unitHeight: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        for (index, point) in outline.outline.enumerated() {
            let x = CGFloat(point.x) * unitWidth
            let y = CGFloat(point.y) * unitHeight
            
            if index == 0 {
                path.move(to: CGPoint(x: x, y: y))
            } else {
                path.addLine(to: CGPoint(x: x, y: y))
            }
        }
        return path
    }
}

struct PentominoView: View {
    let outline: PentominoOutline
    let color: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let unitWidth = CGFloat(15)
                let unitHeight = CGFloat(15)
                
                let outlinePath = Path { path in
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
                
                VStack(spacing: 0) {
                    ForEach(0..<outline.size.height, id: \.self) { row in
                        HStack(spacing: 0) {
                            ForEach(0..<outline.size.width, id: \.self) { column in
                                Rectangle()
                                    .fill(color)
                                    .frame(width: unitWidth, height: unitHeight)
                                    .border(Color.black, width: 1)
                            }
                        }
                    }
                }
                .mask(outlinePath.fill(Color.white))
            }
        }
    }
}
