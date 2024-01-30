//
//  ActionButtonsView.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

struct ActionButtonsView: View {
    @EnvironmentObject var gameManager: GameViewModel
    let submitAction: () -> Void
    let deleteAction: () -> Void
    let isValid: Bool
    let currentWord: String
    
    var body: some View {
        HStack {
            Button(action: deleteAction) {
                Label("Delete", systemImage: "delete.right.fill")
            }
            .buttonStyle(StyledButton(backgroundColor: .red))
            .disabled(currentWord.count == 0)
            
            Spacer()
            
            PointsView(score: gameManager.score)
            
            Spacer()
            
            Button(action: submitAction) {
                Label("Submit", systemImage: "checkmark.circle.fill")
            }
            .buttonStyle(StyledButton(backgroundColor: .green))
            .disabled(!isValid)
        }
    }
}

struct StyledButton: ButtonStyle {
    let backgroundColor: Color
    @Environment(\.isEnabled) var isEnabled: Bool
    
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(isEnabled ? backgroundColor : backgroundColor.opacity(0.5))
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
