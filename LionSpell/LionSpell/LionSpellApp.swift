//
//  LionSpellApp.swift
//  LionSpell
//
//  Created by Shibli Nomani on 1/24/24.
//

import SwiftUI

@main
struct LionSpell2App: App {
    @StateObject var gameManager = GameViewModel(size: 5)

    var body: some Scene {
        WindowGroup {
            ControlView()
                .environmentObject(gameManager)
        }
    }
}
