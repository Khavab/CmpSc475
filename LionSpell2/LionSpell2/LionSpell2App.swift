//
//  LionSpell2App.swift
//  LionSpell2
//
//  Created by Shibli Nomani on 1/23/24.
//

import SwiftUI

@main
struct LionSpell2App: App {
    @StateObject var gameManager = GameViewModel(size: 5)

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(gameManager)
        }
    }
}
