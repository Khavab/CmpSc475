//
//  ActionButtonsView.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

struct ActionButtonsView: View {
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

            Button(action: submitAction) {
                Label("Submit", systemImage: "checkmark.circle.fill")
            }
            .buttonStyle(StyledButton(backgroundColor: .green))
            .disabled(!isValid)
        }
    }
}

struct StyledButton: ButtonStyle {
    var backgroundColor: Color

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .padding()
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(10)
            .scaleEffect(configuration.isPressed ? 0.95 : 1)
    }
}
