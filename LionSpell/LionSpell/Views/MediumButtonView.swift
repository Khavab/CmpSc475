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
    let letter: SpellLetter
    
    var body: some View {
        let centeredLetters = centeredSpellLetters()
        ZStack {
            MediumButton(addLetter: addLetter, cent: false, spellLetter: centeredLetters[0])
                .rotationEffect(.degrees(180))
                .offset(x: -50, y: -65)
            MediumButton(addLetter: addLetter, cent: false, spellLetter: centeredLetters[1])
                .rotationEffect(.degrees(180))
                .offset(x: 50, y: -65)
            MediumButton(addLetter: addLetter, cent: false, spellLetter: centeredLetters[3])
                .rotationEffect(.degrees(180))
                .offset(x: -80, y: 25)
            MediumButton(addLetter: addLetter, cent: true, spellLetter: centeredLetters[2])
            MediumButton(addLetter: addLetter, cent: false, spellLetter: centeredLetters[4])
                .rotationEffect(.degrees(180))
                .offset(x: 0, y: 80)
            MediumButton(addLetter: addLetter, cent: false, spellLetter: centeredLetters[5])
                .rotationEffect(.degrees(180))
                .offset(x: 80, y: 25)
        }
        .frame(width: 400, height: 250)
    }
    
    private func centeredSpellLetters() -> [SpellLetter] {
        var letters = spellLetters
        if let centerIndex = letters.firstIndex(where: { $0.letter == letter.letter }) {
            letters.remove(at: centerIndex)
        }

        let halfIndex = letters.count / 2
        letters.insert(letter, at: halfIndex)
        return letters
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

