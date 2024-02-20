//
//  Styles.swift
//  Campus
//
//  Created by Shibli Nomani on 2/20/24.
//

import SwiftUI

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
