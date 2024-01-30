//
//  HardButtonView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/30/24.
//

import SwiftUI

struct HardButtonView: View {
    let addLetter: (String) -> Void
    let spellLetters: [SpellLetter]
    let letter: SpellLetter
    
    var body: some View {
        let centeredLetters = centeredSpellLetters()
        ZStack {
            HardButton(addLetter:  addLetter, cent: false, spellLetter: centeredLetters[0])
                .offset(x: 0, y: -85)
            HardButton(addLetter:  addLetter, cent: false, spellLetter: centeredLetters[1])
                .offset(x: -75, y: -45)
            HardButton(addLetter:  addLetter, cent: false, spellLetter: centeredLetters[3])
                .offset(x: -75, y: 45)
            HardButton(addLetter:  addLetter, cent: true, spellLetter: centeredLetters[2])
            HardButton(addLetter:  addLetter, cent: false, spellLetter: centeredLetters[4])
                .offset(x: 75, y: -45)
            HardButton(addLetter:  addLetter, cent: false, spellLetter: centeredLetters[5])
                .offset(x: 75, y: 45)
            HardButton(addLetter:  addLetter, cent: false, spellLetter: centeredLetters[6])
                .offset(x: 0, y: 85)
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

struct HardButton: View {
    let addLetter: (String) -> Void
    let cent: Bool
    let spellLetter: SpellLetter
    
    var body: some View {
        Button(action: { addLetter(spellLetter.letter) } ){
            ZStack {
                Hexagon()
                    .frame(width: 90, height: 90)
                    .foregroundColor(cent ? Color.primaryButtonColor : Color.primaryLightColor)
                Text(spellLetter.letter)
                    .font(.title)
                    .foregroundColor(cent ? Color.primaryLightColor : .white)
            }
        }
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
