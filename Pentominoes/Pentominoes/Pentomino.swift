//
//  Pentomino.swift
//  Pentominoes
//
//  Created by Shibli Nomani on 2/6/24.
//

import SwiftUI

struct Pentamino: Shape {
    var outline: [Point]
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        guard !outline.isEmpty else { return path }
        
        let scaleX = rect.width / CGFloat(outline.map { $0.x }.max() ?? 1)
        let scaleY = rect.height / CGFloat(outline.map { $0.y }.max() ?? 1)
        
        let startPoint = outline[0]
        path.move(to: CGPoint(x: CGFloat(startPoint.x) * scaleX, y: CGFloat(startPoint.y) * scaleY))
        
        for point in outline.dropFirst() {
            path.addLine(to: CGPoint(x: CGFloat(point.x) * scaleX, y: CGFloat(point.y) * scaleY))
        }
        
        path.closeSubpath()
        
        return path
    }
}
