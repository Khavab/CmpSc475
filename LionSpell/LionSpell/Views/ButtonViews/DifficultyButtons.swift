//
//  Buttons.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/30/24.
//

import SwiftUI

struct EasyButton: View {
    let addLetter: (String) -> Void
    let cent: Bool
    let letter: Character
    
    var body: some View {
        Button(action: { addLetter(String(letter)) } ){
            ZStack {
                RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                    .frame(width: 75, height: 75)
                    .foregroundColor(cent ? Color.primaryButtonColor : Color.primaryLightColor)
                Text(String(letter))
                    .font(.title)
                    .foregroundColor(cent ? Color.primaryLightColor : .white)
                    .rotationEffect(.degrees(-45))
            }
        }
        .rotationEffect(.degrees(45))
    }
}

struct MediumButton: View {
    let addLetter: (String) -> Void
    let cent: Bool
    let letters: Character
    
    var body: some View {
        Button(action: { addLetter(String(letters)) } ){
            ZStack {
                Pentagon()
                    .frame(width: 90, height: 90)
                    .foregroundColor(cent ? Color.primaryButtonColor : Color.primaryLightColor)
                Text(String(letters))
                    .font(.title)
                    .foregroundColor(cent ? Color.primaryLightColor : .white)
                    .rotationEffect(.degrees(cent ? 0 : 180))
            }
        }
        .rotationEffect(.degrees(cent ? 0 : 180))
    }
}

struct HardButton: View {
    let addLetter: (String) -> Void
    let cent: Bool
    let letters: Character
    
    var body: some View {
        Button(action: { addLetter(String(letters)) } ){
            ZStack {
                Hexagon()
                    .frame(width: 90, height: 90)
                    .foregroundColor(cent ? Color.primaryButtonColor : Color.primaryLightColor)
                Text(String(letters))
                    .font(.title)
                    .foregroundColor(cent ? Color.primaryLightColor : .white)
            }
        }
    }
}
