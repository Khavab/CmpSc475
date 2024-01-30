//
//  ControlView.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/25/24.
//

import SwiftUI

struct ControlView: View {
    @EnvironmentObject var gameManager: GameViewModel
    var body: some View {
        ZStack{
            GameView()
                .environmentObject(gameManager)
        }
    }
}

#Preview {
    ControlView()
        .environmentObject(GameViewModel(size: 5))
}
