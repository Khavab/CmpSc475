//
//  MediumButtonView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/30/24.
//

import SwiftUI

struct MediumButtonView: View {
    let addLetter: (String) -> Void
    let spellLetters: [SpellLetter]
    
    var body: some View {
        MediumButton(addLetter: addLetter, cent: true, spellLetter: spellLetters[0])
        MediumButton(addLetter: addLetter, cent: false, spellLetter: spellLetters[1])
            .offset(x: -50, y: -65)
        MediumButton(addLetter: addLetter, cent: false, spellLetter: spellLetters[2])
            .offset(x: 50, y: -65)
        MediumButton(addLetter: addLetter, cent: false, spellLetter: spellLetters[3])
            .offset(x: -80, y: 25)
        MediumButton(addLetter: addLetter, cent: false, spellLetter: spellLetters[4])
            .offset(x: 0, y: 80)
        MediumButton(addLetter: addLetter, cent: false, spellLetter: spellLetters[5])
            .offset(x: 80, y: 25)
    }
}

struct MediumButton: View {
    let addLetter: (String) -> Void
    let cent: Bool
    let spellLetter: SpellLetter
    
    var body: some View {
        Button(action: { addLetter(spellLetter.letter) } ){
            ZStack {
                Pentagon()
                    .frame(width: 90, height: 90)
                    .foregroundColor(cent ? Color.primaryButtonColor : Color.primaryLightColor)
                Text(spellLetter.letter)
                    .font(.title)
                    .foregroundColor(cent ? Color.primaryLightColor : .white)
                    .rotationEffect(.degrees(cent ? 0 : 180))
            }
        }
        .rotationEffect(.degrees(cent ? 0 : 180))
    }
}

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

