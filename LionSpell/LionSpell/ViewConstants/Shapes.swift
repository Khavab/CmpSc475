//
//  Shapes.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/30/24.
//

import SwiftUI

struct Pentagon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.size.height, rect.size.width) / 2
        let corners = corners(center: center, radius: radius)
        path.move(to: corners[0])
        corners[1...4].forEach() { point in
            path.addLine(to: point)
        }
        path.closeSubpath()
        return path
    }
    
    func corners(center: CGPoint, radius: CGFloat) -> [CGPoint] {
        var points: [CGPoint] = []
        for i in (0...4) {
            let angle = 2 * CGFloat.pi / 5 * CGFloat(i) - CGFloat.pi / 2
            let point = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
            points.append(point)
        }
        return points
    }
}

struct Hexagon: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.size.height, rect.size.width) / 2
        let corners = corners(center: center, radius: radius)
        path.move(to: corners[0])
        corners[1...5].forEach() { point in
            path.addLine(to: point)
        }
        path.closeSubpath()
        return path
    }
    
    func corners(center: CGPoint, radius: CGFloat) -> [CGPoint] {
        var points: [CGPoint] = []
        for i in (0...5) {
            let angle = CGFloat.pi / 3 * CGFloat(i)
            let point = CGPoint(x: center.x + radius * cos(angle), y: center.y + radius * sin(angle))
            points.append(point)
        }
        return points
    }
}
